import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:profile_page/home_page.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'SignUp.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    ));

class LogIn extends StatefulWidget {
  LogIn({Key key}) : super(key: key);
  static String id = 'LogIn';



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
                image: DecorationImage(
              image: AssetImage('images/Background.png'),
              fit: BoxFit.fill,
            )),
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
                            color: Colors.black87,
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

                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    email = value.trim();
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Email Address",
                                      border: OutlineInputBorder() ,
                                      hintText: "Email",
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
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
                                    password = value.trim();
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Password",
                                      border: OutlineInputBorder(),
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                  validator: Validators.compose([
                                    Validators.required('Password is required'),
                                    Validators.minLength(8, 'Characters are less than 8'),
                                  Validators.maxLength(15, 'Characters are greater than 15'),
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: ElevatedButton(
                            onPressed: () async{
                              try {
                                final user = await _auth.signInWithEmailAndPassword(email: email, password: password);

                                if (user != null) {
                                  Navigator.pushNamed(context, HomePage.id);
                                }

                              } catch (e) {
                                print(e);
                              }
                              if (_formKey.currentState.validate()) {
                                print("Form was submitted successfully.");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(194, 78, 84, 1),
                                padding: EdgeInsets.fromLTRB(110, 30, 100, 20)),
                            child: Text('LogIn'),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 50,
                        ),
                        SizedBox(
                          height: 90,
                        ),

                        Center(
                          child: FlatButton(
                            onPressed: ()  {

                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.white),
                            ),
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
// String validateText(String formText) {
//   if (formText.isEmpty) return 'Field is required.';
//
//   return null;
// }