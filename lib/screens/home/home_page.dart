import 'package:flutter/material.dart';
import 'package:home_work_flutter/screens/add/add_page.dart';
import 'package:home_work_flutter/screens/home/widgets/text_item.dart';
import 'package:home_work_flutter/screens/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_work_flutter/screens/models/todo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> items = List<Item>();

  _HomePageState() {
    items.add(Item(text : "ios" , isCheck : false));
    items.add(Item(text : "android" , isCheck : true));
    items.add(Item(text : "test" , isCheck : true));
    items.add(Item(text : "25465" , isCheck : false));
  }

  void _viewAddItem() async {
    final result = await  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPage(),
      ),
    );
    setState(() {

    });
    //items.add(Item(text : result , isCheck : false));
  }

  TextStyle _todoTextStyle(bool isDone) {
    return null;
  }

  _buildRow(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Todo').orderBy('isDone').snapshots(),
      builder: (context , snapshot) {
        if(!snapshot.hasData) return LinearProgressIndicator();
        else return _buildList(context , snapshot.data.documents);
      },
    );
  }

  _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Todo> _todos = snapshot
        .map((documentSnapshot) => Todo.fromSnapshot(documentSnapshot))
        .toList();

    return ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (BuildContext context, int index){
      return GestureDetector(
        onLongPress: () => _viewAddItem,
        child: CheckboxListTile(
            value: _todos[index].isDone,
            title: Text(_todos[index].title ,
              style: _todoTextStyle(_todos[index].isDone),),
            onChanged: (bool selected) {
              _todos[index].isDone = selected;
              _todos[index].refercnce.updateData({'isDone':selected});
            }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),body: _buildRow(context)
    ,
      floatingActionButton: FloatingActionButton(
        onPressed: _viewAddItem,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

}