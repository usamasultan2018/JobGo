import 'package:flutter/material.dart';
import 'package:jobgo/view/auth/login/login_screen.dart';
import 'package:jobgo/view_model/controller/signup/signup_controller.dart';
import 'package:provider/provider.dart';

import '../../../constant/colors/app_colors.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ChangeNotifierProvider(
        create: (BuildContext context) {
          return SignUpController();
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Consumer<SignUpController>(
              builder: (BuildContext context, SignUpController value,
                  Widget? child) {
                return Form(
                  key: value.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Create an Account",
                          style: TextStyle(
                            color: Color(0xff0D0140),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff524B6B),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MyTextField(
                          title: "Full name",
                          hintText: "xyz",
                          controller: value.fullNameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your fullname";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                          title: "Email",
                          hintText: "abc@gmal.com",
                          controller: value.emailController,
                          obscureText: false,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                          title: "Password",
                          hintText: "*********",
                          controller: value.passwordController,
                          obscureText: value.showPassword,
                          iconButton: IconButton(
                            onPressed: () {
                              value.setShowPassword(value.showPassword);
                            },
                            icon: Icon(value.showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MyButton(
                          onTap: () {
                            if (value.formKey.currentState!.validate()) {
                              value.signup(context: context);
                            }
                          },
                          child: value.loading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.6),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: AppColors.blueGrey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return LoginScreen();
                              }));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: AppColors.lightYellow,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.lightYellow,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            )),
      )),
    );
  }
}
