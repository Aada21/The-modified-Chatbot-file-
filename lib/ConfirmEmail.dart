import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2/entity_type.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'LogIn.dart';

class ConfirmEmail extends StatefulWidget {
  static String id = 'confirm-email';
  final String message;

  const ConfirmEmail({Key key, this.message}) : super(key: key);

  @override
  _ConfirmEmailState createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 122, 158, 159),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Center(
          child: Card(
            color: Color.fromARGB(255, 122, 158, 159),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(

                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0,left: 10,right: 10),
                    child: Text(
                      widget.message
                      ,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),

                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white70),
                    onPressed: () {
                      Navigator.pushNamed(context, LogIn.id);
                    },
                    child: Text(
                      'LogIn',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),

                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}