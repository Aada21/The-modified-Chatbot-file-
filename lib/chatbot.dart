import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  static String id = 'Chat_Bot';
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final messageInsert = TextEditingController();
  List<Map> messsages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DocBot',
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              // Flexible(
              //   child: ListView.builder(
              //     reverse: true,
              //     itemCount: messsages.length,
              //     // itemBuilder: (context, index) => chat(
              //     //     messsages[index]["message"].toString(),
              //     //     messsages[index]["data"]),
              //   ),
              // ),
              Divider(
                height: 5.0,
                color: Colors.deepOrange,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
