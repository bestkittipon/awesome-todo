import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  bool isDone;
  String title;
  final DocumentReference refercnce;

  Todo({this.title , this.isDone = false , this.refercnce});

  Todo.fromMap(Map<String, dynamic> map , {this.refercnce})
    :assert(map['title'] != null) ,
     assert(map['isDone'] != null) ,
     title = map['title'],
     isDone = map['isDone'];


  Todo.fromSnapshot(DocumentSnapshot documentSnapshot) : this.fromMap(documentSnapshot.data , refercnce: documentSnapshot.reference);
}