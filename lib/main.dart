import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(RadioApp());
}

class RadioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RadioMobile Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
