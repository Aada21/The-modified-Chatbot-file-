import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile_page/db.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'LogIn.dart';
import 'home_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    ));

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);
  static String id = 'SignUp';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  // Map<String,String> userInfo=new Map();

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/Background.png'),
            fit: BoxFit.fill,
          )),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: screenWidth / 3,
                width: screenWidth / 3.4,
                height: screenHeight / 3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/patient.png')),
                  ),
                ),
              ),

              Positioned(
                top: screenWidth / 2,
                left: screenWidth / 4.9,
                child: Container(
                  child: Text(
                    'Tameny Ya Doctor!',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight / 2.5,
                width: screenWidth / 2.7,
                left: 30,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(7),
                      border: Border(
                          bottom: BorderSide(color: Colors.white),
                          top: BorderSide(color: Colors.white),
                          left: BorderSide(color: Colors.white),
                          right: BorderSide(color: Colors.white))),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "  First Name",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight / 2.5,
                width: screenWidth / 2.7,
                left: 200,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(7),
                      border: Border(
                          bottom: BorderSide(color: Colors.white),
                          top: BorderSide(color: Colors.white),
                          left: BorderSide(color: Colors.white),
                          right: BorderSide(color: Colors.white))),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "  Last Name",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight / 2,
                width: screenWidth - 55,
                left: 30,
                height: 60,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(7),
                      border: Border(
                          bottom: BorderSide(color: Colors.white),
                          top: BorderSide(color: Colors.white),
                          left: BorderSide(color: Colors.white),
                          right: BorderSide(color: Colors.white))),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                    email = value;
                  },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email Address",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight - 280,
                width: screenWidth - 55,
                left: 30,
                height: 60,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(7),
                      border: Border(
                          bottom: BorderSide(color: Colors.white),
                          top: BorderSide(color: Colors.white),
                          left: BorderSide(color: Colors.white),
                          right: BorderSide(color: Colors.white))),
                  child: TextField(
                    textAlign: TextAlign.left,
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Positioned(
                height: screenHeight - 610,
                top: screenHeight - 220,
                width: screenWidth - 55,
                left: screenWidth - 330,
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final newUser =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                             var user = newUser.user;
                              var map = {'fName':'Ahmed' ,'email': user.email,'phone':user.displayName};

                        await DatabaseService(uid: user.uid,info: map).updateUserData();
                        print("3666666"+newUser.toString());

                        if (newUser != null) {
                          Navigator.pushNamed(context, HomePage.id);
                        }
                      } catch (e) {
                        print("55555555555555555555555"+e.toString());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(194, 78, 84, 1),
                        padding: EdgeInsets.fromLTRB(110, 30, 100, 20)),
                    child: Text('SignUp'),
                  ),
                ),
              ),

              //login button above first name
              Positioned(
                top: 220,
                left: 10,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LogIn.id);
                  },
                  child: Text(
                    'LogIn',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              //signup button above first name
              Positioned(
                top: 220,
                left: 110,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUp.id);
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


