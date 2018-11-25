import 'package:meta/meta.dart';

class AppConfig{
  AppConfig({
    @required this.flavorName,
    @required this.appName
  });

  final String flavorName;
  final String appName;
}