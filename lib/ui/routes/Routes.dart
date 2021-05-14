import 'package:amplify/ui/pages/Autenticate/Confirmed/Confirmed.dart';
import 'package:amplify/ui/pages/Autenticate/Forgot/Forget.dart';
import 'package:amplify/ui/pages/Autenticate/Login/Login.dart';
import 'package:amplify/ui/pages/Autenticate/Register/Register.dart';
import 'package:amplify/ui/pages/DashBoard/DashBoard.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  '/login'     : (BuildContext context) => Login(),
  '/register'  : (BuildContext context) => Register(),
  '/'          : (BuildContext context) => DashBoard(),
  '/forget'    : (BuildContext context) => Forget(),
  '/confirmed' : (BuildContext context) => Confirmed(),
  '/dashboard' : (BuildContext context) => DashBoard()
};
