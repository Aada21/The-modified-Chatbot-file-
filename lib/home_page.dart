import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:profile_page/Diabetes.dart';
import 'package:profile_page/History.dart';
import 'package:profile_page/ProfilePage.dart';
import 'package:profile_page/chatbot.dart';

import 'chatbot.dart';

class HomePage extends StatefulWidget {
  static String id = 'Home_Page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Future navigateToChatBot(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatBot()));
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    double Screenh = MediaQuery.of(context).size.height;
    double Screenw = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Screenw,
            height: Screenh,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.blueGrey.withOpacity(.3), Colors.white60]),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    ImageButton(
                      children: <Widget>[],
                      width: 100,
                      height: 100,
                      pressedImage: Image.asset(
                        "images/avatar.png",
                      ),
                      unpressedImage: Image.asset("images/avatar.png"),
                      onTap: () {
                        Navigator.pushNamed(context, ProfilePage.id);
                        print('test');
                      },
                    ),
                    Text(
                      ' Welcome, mio ',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    GridView.count(
                        primary: false,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          ImageButton(
                            children: <Widget>[],
                            width: 100,
                            height: 110,
                            pressedImage: Image.asset(
                              "images/bot.png",
                            ),
                            unpressedImage: Image.asset("images/bot.png"),
                            onTap: () {
                              Navigator.pushNamed(context, ChatBot.id);
                              print('test');
                            },
                          ),
                          ImageButton(
                            children: <Widget>[],
                            width: 100,
                            height: 100,
                            pressedImage: Image.asset(
                              "images/map.png",
                            ),
                            unpressedImage: Image.asset("images/map.png"),
                            onTap: () {
                              print('test');
                            },
                          ),
                          ImageButton(
                            children: <Widget>[],
                            width: 100,
                            height: 110,
                            pressedImage: Image.asset(
                              "images/drugs.png",
                            ),
                            unpressedImage: Image.asset("images/drugs.png"),
                            onTap: () {
                              print('test');
                              Navigator.pushNamed(context, Diabetes.id);
                            },
                          ),
                          ImageButton(
                            children: <Widget>[],
                            width: 100,
                            height: 100,
                            pressedImage: Image.asset(
                              "images/history.png",
                            ),
                            unpressedImage: Image.asset("images/history.png"),
                            onTap: () {
                              print('test');
                              Navigator.pushNamed(context, HistoryPage.id);
                            },
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
