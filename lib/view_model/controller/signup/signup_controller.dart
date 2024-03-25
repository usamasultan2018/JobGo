import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobgo/model/user_model.dart';
import 'package:jobgo/repository/signup_repository.dart';
import 'package:jobgo/view/auth/login/login_screen.dart';

import '../../../utils/utils.dart';

class SignUpController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showPassword = false;
  bool _loading = false;

  bool get showPassword => _showPassword;

  setShowPassword(bool value) {
    _showPassword = value;
    notifyListeners();
  }

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // Function for user registration

  Future<void> signup({required BuildContext context}) async {
    try {
      setLoading(true);
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text);

      User? user = userCredential.user;
      UserModel userModel = UserModel(
        fullName: fullNameController.text,
        email: emailController.text.trim(),
        uid: user!.uid,
      );
      if (user != null) {
        await user.sendEmailVerification();
        await SignUpRepository().createUser(user.uid, userModel).then((value) {
          setLoading(false);
          fullNameController.clear();
          emailController.clear();
          passwordController.clear();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((ctx){
            return LoginScreen();
          })), (route) => false);
          Utils.flushBarDoneMessage(
              'Account create successfully, we have sent a verification email to verify your email. Please check inbox or spam folder.',
              context,
              10);
          SignUpController().dispose();
        }).onError((error, stackTrace) {
          setLoading(false);
          Utils.flushBarErrorMessage(error.toString(), context);
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
      Utils.flushBarErrorMessage(e.toString(), context);
    }
  }
}
