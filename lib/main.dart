import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:profile_page/AnimationList.dart';
import 'package:profile_page/Drugs.dart';
import 'package:profile_page/PdfPreviewScreen.dart';
import 'package:profile_page/ProfilePage.dart';
import 'package:profile_page/SignUp.dart';
import 'package:profile_page/chatbot.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'ConfirmEmail.dart';
import 'ForgotPassword.dart';
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
        Drugs.id: (context) => Drugs(),
        AnimationList.id: (context) => AnimationList(),
        ConfirmEmail.id: (context) => ConfirmEmail(),
        ForgotPassword.id: (context) => ForgotPassword(),
        PdfPreviewScreen.id:(context)=>PdfPreviewScreen(),
      },
    );
  }
}