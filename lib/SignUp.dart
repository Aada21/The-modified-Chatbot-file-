import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile_page/History.dart';
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
                color: Color.fromARGB(255,122, 158, 159)
              ),
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
                          color: Color.fromARGB(255, 238, 245, 219),
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
                                color: Color.fromARGB(255, 238, 245, 219)
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
                              color: Color.fromARGB(255, 238, 245, 219),
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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 238, 245, 219),
                                                width: 1.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 238, 245, 219),
                                                width: 1.0),
                                          ),
                                          labelText: "First Name",
                                          labelStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 238, 245, 219),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(),
                                          hintStyle:
                                          TextStyle( color: Color.fromARGB(
                                              255, 238, 245, 219),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 238, 245, 219),
                                                width: 1.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 238, 245, 219),
                                                width: 1.0),
                                          ),
                                          labelText: "Last Name",
                                          labelStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 238, 245, 219),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(),
                                          hintStyle:
                                          TextStyle( color: Color.fromARGB(
                                              255, 238, 245, 219),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
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
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                          width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                          width: 1.0),
                                    ),
                                    labelText: "Email Address",
                                    labelStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 238, 245, 219),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(),
                                    hintStyle:
                                    TextStyle( color: Color.fromARGB(
                                        255, 238, 245, 219),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
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
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                          width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                          width: 1.0),
                                    ),
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 238, 245, 219),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(),
                                    hintStyle:
                                    TextStyle( color: Color.fromARGB(
                                        255, 238, 245, 219),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
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
                                var mapHistory = {
                                  'H':[]
                                };
                                var mapDrugs = {
                                  'D':[]
                                };
                                await DatabaseService(uid: user.uid, info: map,history:mapHistory,drugs: mapDrugs).init();
                                if (newUser != null) {

                                  Navigator.pushNamed(context, HomePage.id);
                                }
                              } on FirebaseAuthException catch (e) {
                                final snackBar = SnackBar(
                                  content: Text(e.message),
                                  action: SnackBarAction(
                                    label: 'ok',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 238, 245, 219)),
                              primary: Color.fromARGB(255, 79, 99, 103),
                              padding: EdgeInsets.fromLTRB(110, 30, 100, 20)),
                          child: Text('Sign Up',style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      )],
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}