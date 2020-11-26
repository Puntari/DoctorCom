import 'package:Doctorcom/screens/authen.dart';
import 'package:Doctorcom/screens/contact.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authen(),
    );
  }
}
