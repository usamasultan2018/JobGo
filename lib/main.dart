import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobgo/constant/colors/app_colors.dart';
import 'package:jobgo/view/auth/login/login_screen.dart';
import 'package:jobgo/view/introduction/introduction_screen.dart';
import 'package:jobgo/view/splash/splash_screen.dart';
import 'package:jobgo/view_model/services/session_controller.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
          fontFamily: 'DM_Sans'
      ),
      home:LoginScreen(),
    );
  }
}
