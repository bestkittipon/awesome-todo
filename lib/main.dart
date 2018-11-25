import 'package:flutter/material.dart';
import 'package:home_work_flutter/configs/app_config.dart';
import 'package:home_work_flutter/routes.dart';

void main() {
  var configuredApp = AppConfig(flavorName: 'development', appName: 'Email Mockup');
  runApp(HomeApp(configuredApp));
}