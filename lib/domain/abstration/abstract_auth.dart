import 'package:amplify/data/services/Services.dart';

abstract class AbstractAuth {
  Future<ServicesResult> signUp({String email, String password});

  Future<ServicesResult> signIn({String email, String password});
}