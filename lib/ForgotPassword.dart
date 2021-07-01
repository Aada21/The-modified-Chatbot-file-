import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'ConfirmEmail.dart';
import 'LogIn.dart';

class ForgotPassword extends StatefulWidget {
  static String id = 'forgot-password';
  final String message =
      "An email has just been sent to you, Click the link provided to complete password reset";

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String _email;

  _passwordReset() async {
    try {
      _formKey.currentState.save();
      final user = await _auth.sendPasswordResetEmail(email: _email);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return ConfirmEmail(message: widget.message,);
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 122, 158, 159),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Forgot password!',
          style: TextStyle(fontSize:30, color: Colors.white)),
            SizedBox(height: 20,),
              Center(
                child: Text(
                  'We just need your registered email to reset the password.',
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                ),
              ),
              TextFormField(
                onSaved: (newEmail) {
                  _email = newEmail;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  errorStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Send Email'),
                onPressed: () {
                  _passwordReset();
                  print(_email);
                },
              ),
              FlatButton(
                child: Text('Sign In'),
                onPressed: () {
                  Navigator.pushNamed(context, LogIn.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}