import 'package:flutter/material.dart';

class StateSuccess extends StatefulWidget {
  StateSuccess({Key key}) : super(key: key);

  @override
  _StateSuccessState createState() => _StateSuccessState();
}

class _StateSuccessState extends State<StateSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Estamos adentro'),
      ),
    );
  }
}
