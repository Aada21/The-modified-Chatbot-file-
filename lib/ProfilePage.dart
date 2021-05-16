import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class ProfilePage extends StatelessWidget {
  static String id = 'Profile_page';
  @override
  Widget build(BuildContext context) {
    double screenHeight2 = MediaQuery.of(context).size.height;
    double screenWidth2 = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: screenWidth2,
            height: screenHeight2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.blueGrey.withOpacity(.3), Colors.white60])),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 40.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    //back icon
                                    icon: const Icon(Icons.arrow_back_ios),
                                    color: Colors.black,
                                    iconSize: 20.0,

                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 22.0,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                  IconButton(
                                    //back icon
                                    icon: const Icon(Icons.edit),
                                    color: Colors.black,
                                    iconSize: 20.0,
                                    onPressed: () {},
                                  ),
                                ],
                              ))),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 0.0),
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
                                Text(
                                  "Welcome User",
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.0,
                                )
                              ]),
                        ),
                      ),
                      Container(
                        width: screenWidth2 - 50,
                        child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[





















                                 Padding(
                                   padding: const EdgeInsets.fromLTRB(70, 0, 10, 0),

                                   child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Name : ",
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.black)),
                                  ),
                                ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(70, 0, 10, 0),

                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      labelText: "Phone: ",
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                      hintStyle: TextStyle(color: Colors.black)),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(70, 0, 10, 0),

                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      labelText: "Gender: ",
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                      hintStyle: TextStyle(color: Colors.black)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(70, 0, 10, 0),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [DateInputFormatter()],
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      labelText: "BirthDate: ",
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                      hintStyle: TextStyle(color: Colors.black)),
                                ),
                              ),
                            ]),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              //back icon
                              icon: const Icon(Icons.logout),
                              color: Colors.black,
                              iconSize: 30.0,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ]),
                    ]),
              ),
            )),
      ),
    );
  }
}
