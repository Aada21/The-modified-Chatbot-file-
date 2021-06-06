
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imagebutton/imagebutton.dart';
import 'chatbot.dart';
import 'package:intl/intl.dart';


class HistoryPage extends StatefulWidget {

  static String id = 'History_page';


  @override
  _HistoryPageState createState() => _HistoryPageState();

}

class _HistoryPageState extends State<HistoryPage> {

  String _dis='';
  String _setDate='';
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      }
      );
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
                      color: Colors.grey,
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
                                      color: Colors.white,
                                      fontSize: 16.0,
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
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 2.0,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: TextField(
                                    onChanged: (value){
                                      _dis=value;

                                    },

                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.white),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        hintText: ('Diabetes'),
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                        hintStyle:
                                        TextStyle(color: Colors.black)),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 0),
                                  child: Text(
                                    'Date :',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 2.0,
                                      decoration: TextDecoration.none,
                                      height: 5,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Choose your Date',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5,
                                      color:Colors.white ),
                                    ),
                                    InkWell(
                                      onTap: ()
                                      {
                                        _selectDate(context);
                                      },
                                      child:
                                      Container(

                                        width: screenWidth / 1.3,
                                        height: screenHeight / 15,
                                        margin: EdgeInsets.only(top: 7),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),

                                    ),
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
                                              hintText:DateFormat('dd/MM/yyyy').format(selectedDate) ,

                                              disabledBorder:
                                              UnderlineInputBorder(borderSide: BorderSide.none),
                                              // labelText: 'Time',
                                              contentPadding: EdgeInsets.only(top: 0.0)
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

                                          //adding disease


                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red,
                                            onPrimary: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20.0),
                                            )),
                                        child: Text('Cancel'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 110, 30, 0),
                                      child: ElevatedButton(
                                        onPressed: () {

                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green,
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
                      onPressed: () {
                        showDialog();
                      },
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
                    child: AnimationList()
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
                          print('02000');
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
                          print('666');
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
void main() {
  runApp(AnimationList());
}

class AnimationList extends StatefulWidget {

  @override
  _AnimationListState createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation _animation;
  final key = GlobalKey<AnimatedListState>();
  List<String> _items = ["items 1", "items 2", "items 3", "items 4"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(microseconds: 200));
    _animation = CurvedAnimation(curve: Curves.elasticIn, parent: controller);
    _animation = Tween<Offset>(begin: Offset.zero, end: Offset(0.5, 0))
        .animate(_animation);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
          controller.forward();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: _items.length,
                itemBuilder: (context, int index, Animation<double> animation) {
                  return buildItem(_items[index], animation, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String item, Animation animation, int index) {

    return ScaleTransition(
      scale: animation,
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            onPressed: () {
              removeItem(index);
            },
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.amber,
          ),
        ),
      ),
    );
  }

  removeItem(int index) {
    String removeItemed = _items.removeAt(index);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return buildItem(removeItemed, animation, index);
    };
    key.currentState.removeItem(index, builder);
  }

  void addItem() {
    int i = _items.length > 0 ? _items.length : 0;
    _items.insert(i, "Item ${_items.length + 1}");
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



