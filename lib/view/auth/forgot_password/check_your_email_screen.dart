import 'package:flutter/material.dart';
import 'package:jobgo/view/auth/forgot_password/successfully_check_mail_screen.dart';

import '../../../constant/colors/app_colors.dart';
import '../widgets/my_button.dart';
class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({super.key});

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
                  "Check Your Email",
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
                "We have sent the reset password to the email address brandonelouis@gmial.com",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff524B6B),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Image.asset("assets/vector/checkmail_vector.png",height: 93,width: 100,),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 30,
              ),
              MyButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx){
                    return SuccessfullyCheckMail();
                  }));
                },
                child: Text(
                  "OPEN YOUR EMAIL",
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
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You have not received the email?",style: TextStyle(
                    color: AppColors.blueGrey,
                    fontSize: 12,
                  ),),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: (){

                    },
                    child: Text("Resend ",style: TextStyle(
                      color: AppColors.lightYellow,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.lightYellow,
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
