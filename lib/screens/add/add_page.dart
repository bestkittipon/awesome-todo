import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddPageState();

}

class _AddPageState extends State<AddPage> {
  _AddPageState();

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
              onPressed: () => Navigator.pop(context, myController.text),
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