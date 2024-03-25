import 'package:flutter/material.dart';
import 'package:jobgo/view/auth/login/login_screen.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Jobspot",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                child: Center(
                  child: Image.asset(
                    "assets/vector/vector_1.png",
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              Text(
                "Find Your",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Dream Job",
                style: TextStyle(
                  color: Color(0xffFCA34D),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  decorationColor: Color(0xffFCA34D),
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                "Here!",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom: 5),
                child: Text(
                  "Explore all the most exciting job roles based on your interest and study major.",
                  style: TextStyle(
                    color: Color(0xff524B6B),
                    fontSize: 14,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                        return LoginScreen();
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffCCCCCC),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_forward_rounded,color: Colors.white,),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
