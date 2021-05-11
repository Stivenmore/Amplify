import 'package:amplify/amplifyconfiguration.dart';
import 'package:amplify/ui/pages/Autenticate/Home/Home.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:lottie/lottie.dart';
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
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Home()), (route) => false);
      });
    } on AmplifyAlreadyConfiguredException {
      print('No configure');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff212029),
        body: _amplifyConfigured
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.asset(
                      'assets/animation/lottie.json',
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CircularProgressIndicator(
                      backgroundColor: Colors.purple,
                    )
                  ],
                ),
              )
            : Center(
              child: Text('Sin conexion a internet'),
            ));
  }
}
