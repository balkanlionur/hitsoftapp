import 'package:flutter/material.dart';
import 'package:hitsoft/view/policy_list/policy_list.dart';

import 'package:hitsoft/view/user_list/user_list.dart';
import 'package:hitsoft/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
