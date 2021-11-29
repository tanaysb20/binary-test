import 'package:flutter/material.dart';

class HomeDetailScreen extends StatelessWidget {
  final title;
  HomeDetailScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 23, color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
