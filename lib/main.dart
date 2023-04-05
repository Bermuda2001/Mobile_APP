import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_provider/data.dart';
import './app_screens/page.dart';
import './app_screens/test_compare_pic.dart';
import 'package:image_compare/image_compare.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(
    ChangeNotifierProvider(create: (context) => data_c(),
      child: StartApp(),
    )
);


class StartApp extends StatefulWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => LoadingPage(),
        '/second' : (context) => compare_pic(),
      },
    );
  }
}









