import 'package:amplify/amplifyconfiguration.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

class SplasScreen extends StatefulWidget {
  SplasScreen({Key key}) : super(key: key);

  @override
  _SplasScreenState createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  bool _amplifyConfigured = false;
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    AmplifyAuthCognito authCognito = AmplifyAuthCognito();
    AmplifyAnalyticsPinpoint analyticsPlugin = AmplifyAnalyticsPinpoint();
    Amplify.addPlugins([authCognito, analyticsPlugin]);
    try {
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } on AmplifyAlreadyConfiguredException {
      print('No configure');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_amplifyConfigured? 'Configured' : 'Not Configured'),
      ),
    );
  }
}
