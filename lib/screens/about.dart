import 'package:flutter/material.dart';

class ShowAbout extends StatefulWidget {
  @override
  _ShowContactState createState() => _ShowContactState();
}

class _ShowContactState extends State<ShowAbout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('เวอร์ชั่น 1.0.1',
      style: TextStyle(
        fontSize: 24,
        color: Colors.grey,
      ),
      ),
    );
  }
}