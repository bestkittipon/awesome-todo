import 'package:flutter/material.dart';
import 'package:home_work_flutter/configs/app_config.dart';
import 'package:home_work_flutter/screens/home/home_page.dart';

class HomeApp extends StatelessWidget{
  HomeApp(this.config);
  final AppConfig config;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: config.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
    );
  }

}