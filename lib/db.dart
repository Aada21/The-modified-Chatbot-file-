import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String uid;

  Map<String,List<dynamic>>history=new Map();
  Map<String,List<dynamic>>drugs=new Map();
  Map<String, String> info = new Map();
  DatabaseService({this.uid, this.info,this.history,this.drugs});

  final CollectionReference historyCollection =
      FirebaseFirestore.instance.collection('History');
  final CollectionReference profileCollection =
      FirebaseFirestore.instance.collection('Profile');
  final CollectionReference drugsCollection =
      FirebaseFirestore.instance.collection('Drugs');

  Future updateUserData() async {
    return await historyCollection.doc(uid).set(history);
  }
  Future updateUserDrugs() async {
    return await drugsCollection.doc(uid).set(drugs);
  }

  Future updateUserProfile() async {
    return await profileCollection.doc(uid).set(info);
  }
  init(){
    updateUserData();
    updateUserProfile();
    updateUserDrugs();
  }

}
