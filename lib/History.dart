import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imagebutton/imagebutton.dart';
import 'Drugs.dart';
import 'LogIn.dart';
import 'ProfilePage.dart';
import 'chatbot.dart';
import 'package:intl/intl.dart';

import 'db.dart';
import 'home_page.dart';

class HistoryPage extends StatefulWidget {
  static String id = 'History_page';

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<dynamic> items = LogIn.list;

  Animation _animation;
  final key = GlobalKey<AnimatedListState>();
  String _setDate = '';
  String _dis = '';
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  var uid=FirebaseAuth.instance.currentUser.uid;

  //fun.of date.
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromARGB(255,238, 245, 219), // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black,
                // button text color
              ),
            ),
          ),
          child: child,
        );
      },
    );



    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMMMM('en_US').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    void showDialog() {
      //it show dialog
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return Dialog(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: SizedBox(
                height: screenHeight - 190,
                width: screenWidth / 2,
                child: Container(
                    height: screenHeight,
                    width: screenHeight,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255,79, 99, 115),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(60, 15, 10, 0),
                                  child: Text(
                                    'Enter A Diseases ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255,238, 245, 219),
                                      fontSize: 18,
                                      letterSpacing: 2.0,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(10, 30, 10, 0),
                                  child: Text(
                                    'Disease Name :',
                                    style: TextStyle(
                                      color: Color.fromARGB(255,238, 245, 219),
                                      fontSize: 18,
                                      letterSpacing: 2.0,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: TextField(
                                    onChanged: (value) {
                                      _dis = value.trim();
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Diabetes",
                                        hintStyle:TextStyle(color: Color.fromARGB(255,238, 245, 219),fontSize: 16,fontWeight:FontWeight.bold),
                                        labelText: "Diabetes",
                                        labelStyle: TextStyle(color:Color.fromARGB(255,238, 245, 219),fontSize: 16,fontWeight:FontWeight.bold),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color.fromARGB(255,238, 245, 219), width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color.fromARGB(255,238, 245, 219), width: 1.0),
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 0),
                                  child: Text(
                                    'Date :',
                                    style: TextStyle(
                                      color:Color.fromARGB(255,238, 245, 219),
                                      fontSize: 18.0,
                                      letterSpacing: 2.0,
                                      decoration: TextDecoration.none,
                                      height: 5,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    // Text(
                                    //   'Choose your Date',
                                    //   style: TextStyle(
                                    //       fontStyle: FontStyle.italic,
                                    //       fontWeight: FontWeight.w600,
                                    //       letterSpacing: 0.5,
                                    //       color: Colors.white),
                                    // ),
                                    InkWell(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      child: Container(
                                        width: screenWidth / 1.3,
                                        height: screenHeight / 15,
                                        margin: EdgeInsets.only(top: 7),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color.fromARGB(255,238, 245, 219),
                                            width: 1,
                                          ),),
                                        child: TextFormField(
                                          style: TextStyle(fontSize: 40),
                                          textAlign: TextAlign.center,
                                          enabled: false,
                                          keyboardType: TextInputType.text,
                                          controller: _dateController,
                                          onSaved: (String val) {
                                            _setDate = val;
                                          },
                                          decoration: InputDecoration(
                                            hintText:DateFormat.yMMMM('en_US').format(selectedDate),
                                            hintStyle:TextStyle(color: Color.fromARGB(255,238, 245, 219),fontSize: 16,fontWeight:FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //date here
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 110, 10, 0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(255, 254,95, 85),
                                            onPrimary: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20.0),
                                            )),
                                        child: Text('Cancel'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30, 110, 30, 0),
                                      child: ElevatedButton(
                                        onPressed: () async {

                                          if (_dis.isNotEmpty) {
                                            addItem(_dis);
                                            await DatabaseService(uid: uid,history: {'H':items}).updateUserData();
                                            Navigator.pop(context);
                                            _dis = '';
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(255,238, 245, 219),
                                            onPrimary: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20.0),
                                            )),
                                        child: Text('Submit'),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ],
                      ),
                    )),
              ));
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
            Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 79, 99, 103),
            size: 20),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            color: Color.fromARGB(255, 79, 99, 103),
            iconSize: 20.0,
            onPressed: () {
              showDialog();
            },
          )
        ],
        title: Center(
          child: const Text('History',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:  Color.fromARGB(255, 79, 99, 103)),
          ),
        ),
        backgroundColor:Color.fromARGB(255, 238, 245, 219),

      ),
      drawer:Theme(
        data: Theme.of(context).copyWith(
            canvasColor:  Color.fromARGB(255,122, 158, 159)
        ),
        child:Drawer(
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
                    label:Text(
                      'Profile',
                      style: TextStyle(
                          color:  Color.fromARGB(255, 79, 99, 103),
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
                        padding: EdgeInsets.fromLTRB(0, 0, 125, 0),
                        onPressed: () {
                          Navigator.pushNamed(context, HomePage.id);
                        },
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color:Color.fromARGB(255, 238, 245, 219),
                          ),
                        ),
                      ),
                      leading: ImageButton(
                        children: <Widget>[],
                        width: screenWidth / 7,
                        height: screenHeight / 15,
                        pressedImage: Image.asset(
                          "images/hhome.png",
                        ),
                        unpressedImage: Image.asset(
                          "images/hhome.png",
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, HomePage.id);
                          print('666');
                        },
                      ),
                    ),
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
                            color:Color.fromARGB(255, 238, 245, 219),
                          ),
                        ),
                      ),
                      leading: ImageButton(
                        children: <Widget>[],
                        width: screenWidth / 7,
                        height: screenHeight / 15,
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
                            color:Color.fromARGB(255, 238, 245, 219),
                          ),
                        ),
                      ),
                      leading: ImageButton(
                        children: <Widget>[],
                        width: screenWidth / 7,
                        height: screenHeight / 15,
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
                        padding: EdgeInsets.fromLTRB(0, 0, 144, 0),
                        onPressed: () {
                          //Navigator.pushNamed(context, HistoryPage.id);
                        },
                        child: Text(
                          'Map',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color:Color.fromARGB(255, 238, 245, 219),
                          ),
                        ),
                      ),
                      leading: ImageButton(
                        children: <Widget>[],
                        width: screenWidth / 7,
                        height: screenHeight / 15,
                        pressedImage: Image.asset(
                          "images/map.png",
                        ),
                        unpressedImage: Image.asset(
                          "images/map.png",
                        ),
                        onTap: () {
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
                          color:Color.fromARGB(255, 238, 245, 219),
                          fontSize: 18,
                        ),
                      ),
                      leading: ImageButton(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[],
                        width: screenWidth / 9,
                        height: screenHeight / 17,
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
        ),),
      body: SafeArea(
        child: Center(
          child: Container(
            // main container (background)
            width: screenWidth,
            decoration: BoxDecoration(
              color: Color.fromARGB(255,122, 158, 159),
            ),
            child: Stack(children: <Widget>[
              Center(
                child: LayoutBuilder(builder: (context, constrains) {
                  var deviceType = getDeviceType(mediaQueryData);
                  print(deviceType);
                  double localHeight = constrains.maxHeight;
                  double localWidth = constrains.maxWidth;
                  return Container(
                    width: localWidth - 10,
                    height: localHeight - 20,
                    child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection('History')
                            .doc(FirebaseAuth.instance.currentUser.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                                child: CircularProgressIndicator());
                          }
                          items = snapshot.data['H'];
                          return Column(
                            children: [
                              Expanded(
                                  child: AnimatedList(
                                    key: key,
                                    initialItemCount: items.length,
                                    itemBuilder: (context, int index,
                                        Animation<double> animation) {
                                      return buildItem(
                                          items[index], animation, index);
                                    },
                                  ))
                            ],
                          );
                        }),
                  );
                }),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildItem(_dis, Animation animation, index) {
    return ScaleTransition(
      scale: animation,
      child: Card(
        child: ListTile(
          tileColor: Color.fromARGB(255,238, 245, 219),
          title: Text(
            "$_dis",
            style: TextStyle(
                color: Color.fromARGB(255,79, 99, 103),
                fontWeight: FontWeight.bold,
                fontSize: 18),

          ),
          trailing: IconButton(
            onPressed: () async {
              removeItem(index);
              await FirebaseFirestore.instance.collection('History').doc(FirebaseAuth.instance.currentUser.uid).set({'H':items});
            },
            icon: Icon(
              Icons.close,
              color:Color.fromARGB(255,254 , 95, 85),
            ),
          ),
        ),
      ),
    );
  }

  removeItem(int index) {
    String removeItemed = items.removeAt(index);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return buildItem(removeItemed, animation, index);
    };
    key.currentState.removeItem(index, builder);
  }

  void addItem(String x) {
    int i = items.length > 0 ? items.length : 0;
    items.insert(i,
        "$_dis \n${DateFormat.MMMM().format(selectedDate)}/${selectedDate.year}");
    key.currentState.insertItem(i);
  }


}

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double width = 0;
  if (orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  } else {
    width = mediaQueryData.size.width;
  }
  if (width >= 950) {
    return DeviceType.Desktop;
  }
  if (width >= 600) {
    return DeviceType.Tablet;
  }
  return DeviceType.Mobile;
}

enum DeviceType { Mobile, Tablet, Desktop }