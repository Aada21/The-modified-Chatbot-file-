import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  SignUp({Key key}) : super(key: key);
  static String id = 'SignUp';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final _auth = FirebaseAuth.instance;
  String email, password, fName, lName;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/Background.png'),
              fit: BoxFit.fill,
            )),
            child: SingleChildScrollView(
              child: Stack(children: <Widget>[
                Positioned(
                  top: 170,
                  left: 25,
                  width: screenWidth,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                    child: Text(
                      'Tameny Ya Doctor!',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(80, 150, 50, 100),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/patient.png')),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: Row(children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LogIn.id);
                          },
                          child: Text(
                            'LogIn',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignUp.id);
                          },
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]),
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 300.0, 30.0, 0.0),
                  child: Stack(
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: TextFormField(
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.name,
                                      onChanged: (value) {
                                        fName = value;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "First Name ",
                                          border: OutlineInputBorder(),
                                          hintStyle:
                                              TextStyle(color: Colors.white)),
                                      // validator: validateText,
                                      validator: Validators.compose([
                                        Validators.required(
                                            'Enter First Name '),
                                        Validators.minLength(2, 'Too short'),
                                        Validators.patternRegExp(
                                            RegExp(r"^[A-Za-z]+$"),
                                            'Only alphabets '),
                                      ]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: TextFormField(
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.name,
                                      onChanged: (value) {
                                        lName = value;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Last Name ",
                                          border: OutlineInputBorder(),
                                          hintStyle:
                                              TextStyle(color: Colors.white)),
                                      // validator: validateText,
                                      validator: Validators.compose([
                                        Validators.required('Enter Last Name '),
                                        Validators.minLength(2, 'Too short'),
                                        Validators.maxLength(10, 'Too long'),
                                        Validators.patternRegExp(
                                            RegExp(r"^[A-Za-z]+$"),
                                            'Only alphabets'),
                                      ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  email = value;
                                },
                                decoration: InputDecoration(
                                    labelText: "Email Address",
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyle(color: Colors.white)),
                                // validator: validateText,
                                validator: Validators.compose([
                                  Validators.required('Email is required'),
                                  Validators.email('Invalid email address'),
                                ]),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                obscureText: true,
                                onChanged: (value) {
                                  password = value;
                                },
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyle(color: Colors.white)),
                                validator: Validators.compose([
                                  Validators.required('Password is required'),
                                  Validators.minLength(
                                      8, 'Characters are less than 8'),
                                  Validators.maxLength(
                                      15, 'Characters are greater than 15'),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: screenWidth,
                        padding: EdgeInsets.fromLTRB(0, 280, 0, 0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              print("Form was submitted successfully yalla.");
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                var user = newUser.user;
                                var map = {
                                  'fName': fName,
                                  'lName': lName,
                                  'email': user.email,
                                  'phone': '',
                                  'gender': 'male'
                                };

                                await DatabaseService(uid: user.uid, info: map)
                                    .updateUserProfile();

                                if (newUser != null) {
                                  Navigator.pushNamed(context, HomePage.id);
                                }
                              } catch (e) {
                                print(e.toString());
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(194, 78, 84, 1),
                              padding: EdgeInsets.fromLTRB(110, 30, 100, 20)),
                          child: Text('Sign Up'),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
