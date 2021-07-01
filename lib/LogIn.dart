
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:profile_page/home_page.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'SignUp.dart';
import 'package:get/get.dart';

import 'db.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: LogIn(),
));

class LogIn extends StatefulWidget {
  LogIn({Key key}) : super(key: key);
  static String id = 'LogIn';
  static List<dynamic> list;



  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromARGB(255,122, 158, 159)
            ),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Stack(children: <Widget>[
                  Positioned(
                    top: 170,
                    left: 25,
                    width: size.width,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
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
                        padding: EdgeInsets.fromLTRB(80, 80, 50, 100),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/patient.png')),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 25, 0, 200),
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
                                color: Color.fromARGB(255, 238, 245, 219),
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 50, 20, 7),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 50, 10, 7),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SignInButton(
                                  Buttons.Facebook,
                                  mini: true,
                                  onPressed: () {},
                                ),
                                SignInButton(
                                  Buttons.Email,
                                  mini: true,
                                  onPressed: () {},
                                ),
                                SignInButton(
                                  Buttons.Twitter,
                                  mini: true,
                                  onPressed: () {},
                                ),
                              ]),
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 250.0, 30.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key:_formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[100]))),
                                child: TextFormField(
                                  autofocus: true,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      labelText: "Email Address",
                                      labelStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
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
                                      )),
                                  // validator: validateText,
                                  validator: Validators.compose([
                                    Validators.required('Email is required'),
                                    Validators.email('Invalid email address'),
                                  ]),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  obscureText: true,
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 238, 245, 219),
                                            width: 1.0),
                                      )),
                                  validator: Validators.compose([
                                    Validators.required('Password is required'),
                                    Validators.minLength(8, 'Characters are less than 8'),
                                    Validators.maxLength(15, 'Characters are greater than 15'),
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ), Container(
                          width: size.width,
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: ElevatedButton(
                            onPressed: () async{
                              if (_formKey.currentState.validate()) {
                                print("Form was submitted successfully.");
                                try {
                                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                                  if (user != null) {

                                    Navigator.pushNamed(context, HomePage.id);
                                  }
                                } on FirebaseAuthException  catch (e) {
                                  final snackBar = SnackBar(
                                    content: Text(e.message),
                                    action: SnackBarAction(
                                      label: 'ok',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 238, 245, 219)),
                                primary: Color.fromARGB(255, 79, 99, 103),
                                padding: EdgeInsets.fromLTRB(110, 30, 100, 20)),
                            child: Text('LogIn',
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                          ),
                        ),


                        SizedBox(
                          height: 30,
                          width: 50,
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        FlatButton(
                          onPressed: ()  {

                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 238, 245, 219)),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ]),
            ),
          ),
        ));

  }
}