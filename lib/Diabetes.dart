import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imagebutton/imagebutton.dart';
import 'chatbot.dart';

class Diabetes extends StatefulWidget {
  static String id = 'Diabetes_page';
  const Diabetes({Key key}) : super(key: key);

  @override
  _DiabetesState createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            // main container (background)
            width: screenWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.blueGrey.withOpacity(.3), Colors.white60]),
            ),
            child: Stack(children: <Widget>[
              Container(
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text("HOME", //Home word
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )),
                    IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.black,
                      iconSize: 20.0,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Center(
                child: LayoutBuilder(builder: (context, constrains) {
                  var deviceType = getDeviceType(mediaQueryData);
                  print(deviceType);
                  double localHeight = constrains.maxHeight;
                  double localWidth = constrains.maxWidth;

                  return Container(
                    //The central container in which the text will be located
                    width: localWidth - 85,
                    height: localHeight - 190,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(
                            //The text field to which the medical history will be added
                            keyboardType: TextInputType.multiline,
                            maxLines: 15,
                            decoration: InputDecoration(
                              contentPadding: //EdgeInsets.fromLTRB(15, 222, 15, 2),
                                  EdgeInsetsDirectional.fromSTEB(
                                      10, 124, 30, 208),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.white,
                                  )),
                              focusColor: Colors.white60,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Diabetes',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ImageButton(
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
                          print('احنا نبطشية بس صنيعية');
                        },
                      ),
                      ImageButton(
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
                          print('احنا نبطشية بس صنيعية 2');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
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
