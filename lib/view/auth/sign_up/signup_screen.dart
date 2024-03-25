import 'package:flutter/material.dart';

import '../../../constant/colors/app_colors.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController  = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  controller: emailController,
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
                  title: "Email",
                  hintText: "abc@gmal.com",
                  controller: emailController,
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
                  controller: passwordController,
                  obscureText: showPassword,
                  iconButton: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off),
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
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: MyButton(
                  onTap: () {},
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(
                    color: AppColors.blueGrey,
                    fontSize: 12,
                  ),),
                  SizedBox(width: 5,),
                  Text("Login",style: TextStyle(
                    color: AppColors.yellow,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.yellow,
                    fontSize: 12,
                  ),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
