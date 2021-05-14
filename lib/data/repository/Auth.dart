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
      Map<String, String> userAttributes = {
        'email': email,
        // additional attributes as needed
      };
      print('entro en try');
      print('Intentamos agregar el usuario a AWS');
      final resp = await amplify.Auth.signUp(
          username: email,
          password: password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      print('Estatus que recibo' + resp.isSignUpComplete.toString());
      if (resp.isSignUpComplete) {
        print('Agregado');
        return ServicesResult(status: true, success: 'Registrado');
      } else {
        print('Imcompleto');
        return ServicesResult(status: false, success: 'Incompleto');
      }
    } on AuthException catch (e) {
      print(e.toString());
      return ServicesResult(status: false, error: 'No registrado');
    }
  }

  @override
  Future<ServicesResult> signIn({String email, String password}) async {
    try {
      final resp = await amplify.Auth.signIn(
        username: email,
        password: password,
      );
      if (resp.isSignedIn) {
        return ServicesResult(status: true, success: 'Logeado');
      } else {
        return ServicesResult(status: false, error: 'No Logeado');
      }
    } on AmplifyException {
      return ServicesResult(status: false, error: 'No Logeado');
    }
  }

  @override
  Future<ServicesResult> confirmedCode({String email, String code}) async {
    try {
      final resp = await amplify.Auth.confirmSignUp(
          username: email, confirmationCode: code);
      if (resp.isSignUpComplete) {
        return ServicesResult(status: true, success: 'Confirmado');
      } else {
        return ServicesResult(status: false, success: 'no Confirmado');
      }
    } on AuthException catch (e) {
      print('Estoy en error de confirmetcode');
      print(e.toString());
      return ServicesResult(status: false, error: 'no Confirmado');
    }
  }

  @override
  Future<ServicesResult> forget({String email}) async {
    try {
      final resp = await amplify.Auth.resetPassword(username: email);
      if (resp.isPasswordReset) {
        return ServicesResult(status: true, success: 'Email enviado');
      } else {
        return ServicesResult(status: false, success: 'Email no enviado');
      }
    } on AuthException catch (e) {
      print(e.toString());
      return ServicesResult(status: false, success: 'Email no enviado');
    }
  }

  @override
  Future<ServicesResult> resetCode({String email}) async {
    try {
      final resp = await amplify.Auth.resendSignUpCode(username: email);
      if (resp.codeDeliveryDetails.destination.isNotEmpty) {
        print(resp.codeDeliveryDetails.destination);
        return ServicesResult(status: true, success: 'Email enviado');
      } else {
        return ServicesResult(status: false, success: 'Email no enviado');
      }
    } on AuthException catch (e) {
      print(e.toString());
      return ServicesResult(status: false, success: 'Email no enviado');
    }
  }
}
