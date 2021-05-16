//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:profile_page/Diabetes.dart';
import 'package:profile_page/ProfilePage.dart';
import 'package:profile_page/chatbot.dart';
import 'History.dart';
import 'LogIn.dart';
import 'home_page.dart';

void main() => runApp(DogBot());

class DogBot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Home',

      debugShowCheckedModeBanner: false,
      initialRoute: LogIn.id,
      routes: {
        LogIn.id: (context) => LogIn(),
        ProfilePage.id: (context) => ProfilePage(),
        HomePage.id: (context) => HomePage(),
        ChatBot.id: (context) => ChatBot(),
        HistoryPage.id: (context) => HistoryPage(),
        Diabetes.id: (context) => Diabetes(),
      },
    );
  }
}
