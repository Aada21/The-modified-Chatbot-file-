import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';

DialogflowGrpcV2Beta1 dialogflow;
void main() {
  runApp(MaterialApp(
    home: ChatBot(),
    debugShowCheckedModeBanner: false,
  ));
}
class ChatBot extends StatefulWidget {
  static String id = 'Chat_Bot';
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  // TODO DialogflowGrpc class instance
  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    // TODO Get a Service account
    // Get a Service account
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('assets/credentials.json'))}');
    // Create a DialogflowGrpc Instance
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);

  }

  void handleSubmitted(text) async {
    print(text);
    _textController.clear();
    //TODO Dialogflow Code
    ChatMessage message = ChatMessage(
      text: text,
      name: "You",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    DetectIntentResponse data = await dialogflow.detectIntent(text, 'en-US');
    String fulfillmentText = data.queryResult.fulfillmentText;
    if(fulfillmentText.isNotEmpty) {
      ChatMessage botMessage = ChatMessage(
        text: fulfillmentText,
        name: "Bot",
        type: false,
      );

      setState(() {
        _messages.insert(0, botMessage);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "          Doctor Bot",
            style: TextStyle(
                color: Color.fromARGB(255, 79, 99, 103),
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          leading: IconButton(
            //back icon
            icon: const Icon(Icons.arrow_back_ios),
            color: Color.fromARGB(255, 79, 99, 103),
            iconSize: 25.0,

            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color.fromARGB(255, 238, 245, 219),
        ),
        body: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255,122, 158, 159)),
            child:Column(children: <Widget>[
              Flexible(
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    reverse: true,
                    itemBuilder: (_, int index) => _messages[index],
                    itemCount: _messages.length,
                  )),
              Divider(height: 1.0),
              Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 238, 245, 219),),
                  child: IconTheme(
                    data: IconThemeData(color: Theme.of(context).accentColor),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              controller: _textController,
                              onSubmitted: handleSubmitted,
                              decoration: InputDecoration.collapsed(hintText: "Send a message",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 79, 99, 103),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            child: IconButton(
                              icon: Icon(Icons.send),
                              onPressed: () => handleSubmitted(_textController.text),
                              color: Color.fromARGB(255, 79, 99, 103),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),
            ])
        ));
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    //
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(child: new Text('B'),
          backgroundImage: AssetImage("images/bot.png"),
          radius: 25,
          backgroundColor: Color.fromARGB(255, 238, 245, 219),
        ),


      ),
      new Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.name,
              style: TextStyle(color: Color.fromARGB(255, 79, 99, 103),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text,style: TextStyle(color: Color.fromARGB(
                  255, 238, 245, 219),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(this.name, style: TextStyle(color: Color.fromARGB(255, 79, 99, 103),
                fontSize: 16,
                fontWeight: FontWeight.bold),),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text,style: TextStyle(color: Color.fromARGB(
                  255, 238, 245, 219),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          //pic of user
            backgroundImage: AssetImage("images/avaus.png"),
            radius: 25,
            backgroundColor: Color.fromARGB(255, 238, 245, 219),
            child: Text('',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
