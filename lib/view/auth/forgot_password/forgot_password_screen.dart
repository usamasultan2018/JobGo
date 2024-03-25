import 'package:flutter/material.dart';
import 'package:jobgo/view/auth/forgot_password/check_your_email_screen.dart';

import '../../../constant/colors/app_colors.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Forgot Password?",
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
                "To reset your password, you need your email or mobile number that can be authenticated",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff524B6B),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Image.asset("assets/vector/forgot_vector.png",height: 93,width: 100,),
              SizedBox(
                height: 40,
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
                height: 30,
              ),
              MyButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx){
                    return CheckYourEmailScreen();
                  }));
                },
                child: Text(
                  "RESET PASSWORD",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.6),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyButton(
                  bckColor: AppColors.grey,
                  onTap: () {},
                  child: Text(
                    "BACK TO LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 0.6,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
