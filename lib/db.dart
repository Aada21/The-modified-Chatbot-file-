import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  Map<String,String> info=new Map();

  DatabaseService( {this.uid,this.info});

  final CollectionReference historyCollection =
      FirebaseFirestore.instance.collection('History');

  Future updateUserData() async {
    return await historyCollection.doc(uid).set(info);
  }
}
