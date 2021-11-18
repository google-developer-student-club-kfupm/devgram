import 'package:dev_gram/views/home_view.dart';
import 'package:dev_gram/views/main_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // home: const HomeView(),
      home: const MainView(),
    );
  }
}
