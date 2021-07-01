import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:profile_page/SignUp.dart';
import 'package:profile_page/home_page.dart';


class SplashScreen extends StatefulWidget {

  static String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
          if(FirebaseAuth.instance.currentUser!=null)
          {
            Navigator.pushNamed(context, HomePage.id);
          }
          else
          {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) =>SignUp()));
          }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(

            color: Color.fromARGB(255,122, 158, 159),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo here
              Image.asset(
                'images/patient.png',
                height: 120,
              ),
              SizedBox(
                height: 30,
              ),

              SpinKitPulse(
                  color: Colors.white,
                  size: 50,
                ),

          ],
          ),
        ),
      ),
    );
  }
}
