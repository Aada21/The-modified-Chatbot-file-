import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  Map<String,String> info=new Map();
  DatabaseService( {this.uid,this.info});

  final CollectionReference historyCollection =
      FirebaseFirestore.instance.collection('History');
  final CollectionReference profileCollection =
  FirebaseFirestore.instance.collection('Profile');
  final CollectionReference users = FirebaseFirestore.instance.collection('Profile');

  Future updateUserData() async {
    return await historyCollection.doc(uid).set(info);
  }
  Future updateUserProfile() async {
    return await profileCollection.doc(uid).set(info);
  }
  void  getData() async{
final   data= (await FirebaseFirestore.instance.collection('Profile').doc(uid).get());
  print(data.data()['fName']);
}
}
