import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_binary/providers/home_provider.dart';
import 'package:test_binary/tab_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: TabBarScreen(),
      ),
    );
  }
}
