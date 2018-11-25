import 'package:flutter/material.dart';
import 'package:home_work_flutter/screens/models/item.dart';

class TextItem extends StatelessWidget {
  TextItem(this.item);

  final Item item;


  @override
  Widget build(BuildContext context) {
    if(item.isCheck){
      return Text(
        item.text,
        style: TextStyle(fontSize: 30.0 , decoration: TextDecoration.lineThrough),
      );
    }else {
      return Text(
        item.text,
        style: TextStyle(fontSize: 30.0),
      );
    }
  }

}