import 'package:amplify/data/services/Services.dart';
import 'package:amplify/domain/abstration/abstract_auth.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_flutter/amplify.dart';

class Auth extends AbstractAuth {
  AmplifyClass amplify = Amplify;

  @override
  Future<ServicesResult> signUp({String email, String password}) async {
    try {
      Map<String, String> userAttributes = {'email': 'email@example.com'};

      await amplify.Auth.signUp(
          username: email,
          password: password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));
      return ServicesResult(status: true, success: 'Registrado');
    } on AmplifyException {
      return ServicesResult(status: false, error: 'No registrado');
    }
  }

  @override
  Future<ServicesResult> signIn({String email, String password}) async {
    try {
      await amplify.Auth.signIn(
        username: email,
        password: password,
      );
      return ServicesResult(status: true, success: 'Logeado');
    } on AmplifyException {
      return ServicesResult(status: false, error: 'No Logeado');
    }
  }
}
