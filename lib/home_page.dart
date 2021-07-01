import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:profile_page/Drugs.dart';
import 'package:profile_page/History.dart';
import 'package:profile_page/ProfilePage.dart';
import 'package:profile_page/chatbot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chatbot.dart';
import 'loading.dart';

class HomePage extends StatefulWidget {
  static String id = 'Home_Page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _openMap() async {
    const url =
        'https://www.google.com/maps/search/hospitals/@30.4646372,31.1860425,20z';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 79, 99, 103)),
        title: const Text(
          '                  Home',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 79, 99, 103)),
        ),
        backgroundColor: Color.fromARGB(255, 238, 245, 219),
      ),
      drawer: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Color.fromARGB(255, 122, 158, 159)),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 238, 245, 219), //header
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageButton(
                    label: Text(
                      'Profile',
                      style: TextStyle(
                          color: Color.fromARGB(255, 79, 99, 103),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
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
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: FlatButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 130, 0),
                        onPressed: () {
                          Navigator.pushNamed(context, ChatBot.id);
                        },
                        child: Text(
                          'Doc Bot',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromARGB(255, 238, 245, 219),
                          ),
                        ),
                      ),
                      leading: ImageButton(
                        children: <Widget>[],
                        width: Screenw / 7,
                        height: Screenh / 15,
                        pressedImage: Image.asset(
                          "images/bot.png",
                        ),
                        unpressedImage: Image.asset(
                          "images/bot.png",
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, ChatBot.id);
                          print('666');
                        },
                      ),
                    ),
                    ListTile(
                      title: FlatButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 140, 0),
                        onPressed: () {
                          Navigator.pushNamed(context, Drugs.id);
                        },
                        child: Text(
                          'Drugs',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromARGB(255, 238, 245, 219),
                          ),
                        ),
                      ),
                      leading: ImageButton(
                        children: <Widget>[],
                        width: Screenw / 7,
                        height: Screenh / 15,
                        pressedImage: Image.asset(
                          "images/drugs.png",
                        ),
                        unpressedImage: Image.asset(
                          "images/drugs.png",
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Drugs.id);
                          print('666');
                        },
                      ),
                    ),
                    ListTile(
                      title: FlatButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 125, 0),
                        onPressed: () {
                          Navigator.pushNamed(context, HistoryPage.id);
                        },
                        child: Text(
                          'History',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromARGB(255, 238, 245, 219),
                          ),
                        ),
                      ),
                      leading: ImageButton(
                        children: <Widget>[],
                        width: Screenw / 7,
                        height: Screenh / 15,
                        pressedImage: Image.asset(
                          "images/history.png",
                        ),
                        unpressedImage: Image.asset(
                          "images/history.png",
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, HistoryPage.id);
                          print('666');
                        },
                      ),
                    ),
                    ListTile(
                      title: FlatButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 144, 0),
                        onPressed: () {
                          _openMap();
                          //Navigator.pushNamed(context, HistoryPage.id);
                        },
                        child: Text(
                          'Map',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromARGB(255, 238, 245, 219),
                          ),
                        ),
                      ),
                      leading: ImageButton(
                        children: <Widget>[],
                        width: Screenw / 7,
                        height: Screenh / 15,
                        pressedImage: Image.asset(
                          "images/map.png",
                        ),
                        unpressedImage: Image.asset(
                          "images/map.png",
                        ),
                        onTap: () {
                          _openMap();
                          //  Navigator.pushNamed(context, HistoryPage.id);
                          print('666');
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Pdf',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 238, 245, 219),
                          fontSize: 18,
                        ),
                      ),
                      leading: ImageButton(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[],
                        width: Screenw / 9,
                        height: Screenh / 17,
                        pressedImage: Image.asset(
                          "images/pdf1.png",
                        ),
                        unpressedImage: Image.asset(
                          "images/pdf1.png",
                        ),
                        onTap: () {
                          print('02000');
                        },
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: Screenw,
            height: Screenh,
            decoration: BoxDecoration(
                color: Color.fromARGB(255,122, 158, 159)
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
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
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Profile')
                            .doc(_auth.currentUser.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: Loading());
                          }
                          return Text(
                            "Welcome ${snapshot.data['fName']}",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Color.fromARGB(255, 238, 245, 219),
                            ),
                          );
                        }),
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
                              _openMap();
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
                              Navigator.pushNamed(context, Drugs.id);
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
