import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddPageState();

}

class _AddPageState extends State<AddPage> {
  _AddPageState();
  Firestore db = Firestore.instance;

  _addTodoItem(String text) async {
    if(text != null && text.length > 0) {
      var data = new Map<String , dynamic>();
      data['title'] = text;
      data['isDone'] = false;
      db.collection('Todo').add(data);
    }
    Navigator.pop(context, myController.text);
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Add"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              tooltip: 'back',
              onPressed: () => _addTodoItem(myController.text),
            )
        ),
      body: Container(
        child: TextField(
          controller: myController,
          decoration: InputDecoration(
             contentPadding: EdgeInsets.all(10.0),
              hintText: 'Enter todo here...'
          ),
        ),
      ),
    );
  }
}