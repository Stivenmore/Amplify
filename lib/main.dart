import 'package:amplify/domain/cubit/amplifyauth_cubit.dart';
import 'package:amplify/ui/pages/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AmplifyauthCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Amplify',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: SplasScreen()),
    );
  }
}
