//import 'dart:html';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:profile_page/Diabetes.dart';
import 'package:profile_page/ProfilePage.dart';
import 'package:profile_page/SignUp.dart';
import 'package:profile_page/chatbot.dart';

import 'History.dart';
import 'LogIn.dart';
import 'SplashScreen.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DogBot());
}

class DogBot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Home',

      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LogIn.id: (context) => LogIn(),
        SignUp.id: (context) => SignUp(),
        ProfilePage.id: (context) => ProfilePage(),
        HomePage.id: (context) => HomePage(),
        ChatBot.id: (context) => ChatBot(),
        HistoryPage.id: (context) => HistoryPage(),
        Diabetes.id: (context) => Diabetes(),
      },
    );
  }
}
