import 'package:flutter/material.dart';

class StateError extends StatefulWidget {
  StateError({Key key}) : super(key: key);

  @override
  _StateErrorState createState() => _StateErrorState();
}

class _StateErrorState extends State<StateError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Tenemos un error', style:TextStyle(fontSize: 20)),
      ),
    );
  }
}
