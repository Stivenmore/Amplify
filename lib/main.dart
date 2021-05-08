import 'package:amplify/ui/pages/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amplify',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplasScreen()
    );
  }
}
