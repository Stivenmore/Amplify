import 'package:amplify/domain/cubit/amplifyauth_cubit.dart';
import 'package:amplify/ui/pages/DashBoard/State/StateError.dart';
import 'package:amplify/ui/pages/DashBoard/State/StateSuccess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AmplifyauthCubit, AmplifyauthState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case AmplifyauthSuccess:
            return StateSuccess();
            break;
          case AmplifyauthError:
            return StateError();
          default:
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
