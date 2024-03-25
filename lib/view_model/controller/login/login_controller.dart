import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jobgo/view/home/home_screen.dart';
import 'package:jobgo/view_model/services/session_controller.dart';

import '../../../utils/utils.dart';

class LoginController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _showPassword = true;

  bool get showPassword => _showPassword;

  void toggleShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners(); // Notify listeners after modifying the state
  }

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login({required BuildContext context}) async {
    try {
      setLoading(true);
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text);

      User? user = userCredential.user;
      if(!user!.emailVerified){
        setLoading(false);
        userEmailIsNotVerified(context, user);
      }
      else{
        CollectionReference ref = FirebaseFirestore.instance.collection("User");
        ref.doc(user.uid).get().then((value)async{
          setLoading(false);
          await SessionController.saveUserInPreference(value.data());
          await SessionController.getUserFromPreference();
          emailController.clear();
          passwordController.clear();

          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (ctx){
                return HomeScreen();
          }), (route) => false);
        });
      }
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (e.code == 'email-already-in-use') {
        Utils.flushBarErrorMessage(e.message.toString(), context);
      } else if (e.code == 'missing-email') {
        Utils.flushBarErrorMessage('Email address not found', context);
      } else if (e.code == 'wrong-password') {
        Utils.flushBarErrorMessage(e.message.toString(), context);
      } else if (e.code == 'user-not-found') {
        Utils.flushBarErrorMessage(e.message.toString(), context);
      } else {
        Utils.flushBarErrorMessage(e.message.toString(), context);
      }
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
  void userEmailIsNotVerified(context, User user) {
    if (kIsWeb) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
                  'Verify Email',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 18),
                )),
            content: Text(
              'Your email is not verified. We have already sent you an email link to verify your email.',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 16),
            ),
            actions: [
              GestureDetector(
                  onTap: () {
                    user.sendEmailVerification().then((value) {
                      Utils.flushBarDoneMessage('Email sent', context, 2);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    'Send again',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 16),
                  )),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Close',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 16),
                  )),
              const SizedBox(
                width: 10,
              ),
            ],
          );
        },
      );
    } else if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Center(
                child: Text(
                  'Verify Email',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 18),
                )),
            content: Text(
              'Your email is not verified. We have already sent you an email link to verify your email.',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 16),
            ),
            actions: [
              GestureDetector(
                  onTap: () {
                    user.sendEmailVerification().then((value) {
                      Navigator.pop(context);
                      Utils.flushBarDoneMessage('Email sent', context, 2);

                    });
                  },
                  child: Text(
                    'Send again',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 16),
                  )),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Close',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 16),
                  )),
              const SizedBox(
                width: 10,
              ),
            ],
          );
        },
      );
    } else {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Verify Email'),
          content: const Text(
              'Your email is not verified. We have already sent you an email link to verify your email.'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              /// This parameter indicates this action is the default,
              /// and turns the action's text to bold text.
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              /// This parameter indicates the action would perform
              /// a destructive action such as deletion, and turns
              /// the action's text color to red.
              isDestructiveAction: true,
              onPressed: () {
                user.sendEmailVerification().then((value) {
                  Utils.flushBarDoneMessage('Email sent', context, 2);
                  Navigator.pop(context);
                });
              },
              child: const Text('Send again'),
            ),
          ],
        ),
      );
    }
  }
}
