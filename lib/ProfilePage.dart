import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:profile_page/db.dart';

import 'LogIn.dart';
import 'loading.dart';

class ProfilePage extends StatefulWidget {
  static String id = 'Profile_page';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var d;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight2 = MediaQuery.of(context).size.height;
    double screenWidth2 = MediaQuery.of(context).size.width;
    var User = FirebaseAuth.instance.currentUser.displayName;
    final _auth = FirebaseAuth.instance;

    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: Color.fromARGB(255, 79, 99, 103),
            iconSize: 25.0,
            onPressed: () {
              _signOut();
              Navigator.pushNamed(context, LogIn.id);
            },
          )
        ],
        leading: IconButton(
          //back icon
          icon: const Icon(Icons.arrow_back_ios),
          color: Color.fromARGB(255, 79, 99, 103),
          iconSize: 25.0,

          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 79, 99, 103)),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 238, 245, 219),
      ),
      body: SafeArea(
        child: Container(
            width: screenWidth2,
            height: screenHeight2,
            child: Scaffold(
              backgroundColor: Color.fromARGB(255, 122, 158, 159),
              body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(35, 25, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("images/user.jpg"),
                                  radius: 80.0,
                                ),
                                SizedBox(
                                  height: 10.0,
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
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                        ),
                                      );
                                    }),
                                SizedBox(
                                  height: 40.0,
                                )
                              ]),
                        ),
                      ),
                      Stack(children: [
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Profile')
                                .doc(_auth.currentUser.uid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(child: Loading());
                              }
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                        //Name

                                        padding: const EdgeInsets.fromLTRB(
                                            110, 14, 0, 0),
                                        child: Text(
                                          '${snapshot.data['fName']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Color.fromARGB(
                                                255, 238, 245, 219),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          110, 40, 10, 0),
                                      child: Text(
                                        'phone',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          110, 45, 10, 0),
                                      child: Text(
                                        "${snapshot.data['gender']}",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          110, 50, 10, 0),
                                      child: Text(
                                        'birth',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Color.fromARGB(
                                              255, 238, 245, 219),
                                        ),
                                      ),
                                    ),
                                  ]);
                            }),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                child: Text(
                                  'Name :',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromARGB(255, 238, 245, 219),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 40, 10, 0),
                                child: Text(
                                  'Phone :',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromARGB(255, 238, 245, 219),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 45, 10, 0),
                                child: Text(
                                  'Gender :',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromARGB(255, 238, 245, 219),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 50, 10, 0),
                                child: Text(
                                  'BirthDate :',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromARGB(255, 238, 245, 219),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ]),
              ),
            )),
      ),
    );
  }
}

class GenderField extends StatelessWidget {
  final List<String> genderList;

  GenderField(this.genderList);

  @override
  Widget build(BuildContext context) {
    String select;
    Map<int, String> mappedGender = genderList.asMap();

    return StatefulBuilder(
      builder: (_, StateSetter setState) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...mappedGender.entries.map(
            (MapEntry<int, String> mapEntry) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: Theme.of(context).primaryColor,
                    groupValue: select,
                    value: genderList[mapEntry.key],
                    onChanged: (value) => setState(() => select = value),
                  ),
                  Text(
                    mapEntry.value,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

getData(var id) async {
  final data =
      await FirebaseFirestore.instance.collection('Profile').doc(id).get();

  return await data.data()['fName'];
}
