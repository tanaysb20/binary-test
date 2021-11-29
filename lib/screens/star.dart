import 'package:flutter/material.dart';

class StarScreen extends StatefulWidget {
  const StarScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Star"),
      ),
    );
  }
}
