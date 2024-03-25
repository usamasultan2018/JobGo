import 'package:flutter/material.dart';
import 'package:jobgo/constant/colors/app_colors.dart';
import 'package:jobgo/view/introduction/introduction_screen.dart';
import 'package:jobgo/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
          fontFamily: 'DM_Sans'
      ),
      home:IntroductionScreen(),
    );
  }
}
