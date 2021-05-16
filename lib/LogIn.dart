import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:profile_page/home_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    ));

class LogIn extends StatelessWidget {
  static String id = 'LogIn';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/Background.png'),
              fit: BoxFit.fill,
            )),
            child: Column(children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: 800,
                child: Stack(children: <Widget>[
                  Container(
                    width: size.width,
                    child: Expanded(
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(80, 80, 50, 100),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/patient.png')),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          left: 105,
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
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 200),
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
                              onPressed: () {},
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
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 010),
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
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 250.0, 30.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.3),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 10.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[100]))),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email or Phone number",
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 50,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(194, 78, 84, 1),
                                Color.fromRGBO(194, 78, 84, 1),
                              ])),
                          child: Center(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, HomePage.id);
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ]),
          ),
        ));
  }
}
