import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/Screens/HomeScreen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list/Screens/TodoScreen.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
