import 'package:flutter/material.dart';
import 'package:home_work_flutter/screens/add/add_page.dart';
import 'package:home_work_flutter/screens/home/widgets/text_item.dart';
import 'package:home_work_flutter/screens/models/item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> items = List<Item>();

  void _viewAddItem() async {
    final result = await  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPage(),
      ),
    );

    items.add(Item(text : result , isCheck : false));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),body: Container(
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (buildContext, position) {
            return GestureDetector(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextItem(items[position])
                  ),
                  Expanded(
                    child: Checkbox(value: items[position].isCheck, onChanged: (bool value) {
                      setState(() {
                        items[position].isCheck = value;
                      });
                    }),
                  )
                ],
              ),
            );
          }),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewAddItem,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

}