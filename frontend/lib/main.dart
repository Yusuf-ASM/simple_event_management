import 'package:flutter/material.dart';
import 'package:simple_event_management/backend/shared_variables.dart';
import 'package:simple_event_management/login_page.dart';

void main(List<String> args) async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: mainColor),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
