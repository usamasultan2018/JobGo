import 'package:flutter/material.dart';
import 'package:jobgo/constant/colors/app_colors.dart';
import 'package:jobgo/view/auth/forgot_password/forgot_password_screen.dart';
import 'package:jobgo/view/auth/sign_up/signup_screen.dart';

import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  "Welcome Back",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5.0), // Set border radius here
                          ),
                          fillColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.white; // Checked color
                              }
                              return AppColors.lightGrey; // Unchecked color
                            },
                          ),
                          side: BorderSide(color: Colors.transparent),
                          checkColor: AppColors.darkBlue,
                          activeColor: Colors.white,
                          value: false,
                          onChanged: (value) {}),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                        return ForgotPasswordScreen();
                      }));
                    },
                    child: Text(
                      "Forgot password ?",
                      style: TextStyle(
                        color: AppColors.ultraDarkBlue,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: MyButton(
                  onTap: () {},
                  child: Text(
                    "Login",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: MyButton(
                    bckColor: AppColors.grey,
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                image: AssetImage("assets/icons/google_icon.png"),
                                fit: BoxFit.fill,
                              )
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text("Sign in with Google",style: TextStyle(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 0.6,
                        ),)
                      ],
                    )),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You don't have an account yet?",style: TextStyle(
                    color: AppColors.blueGrey,
                    fontSize: 12,
                  ),),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                        return SignUpScreen();
                      }));
                    },
                    child: Text("Sign up ",style: TextStyle(
                      color: AppColors.yellow,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.yellow,
                      fontSize: 12,
                    ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
