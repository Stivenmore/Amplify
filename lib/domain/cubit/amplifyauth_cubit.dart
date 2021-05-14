import 'package:amplify/data/repository/Auth.dart';
import 'package:amplify/data/services/Services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'amplifyauth_state.dart';

class AmplifyauthCubit extends Cubit<AmplifyauthState> {
  Auth _auth;
  AmplifyauthCubit({Auth auth})
      : _auth = auth ?? Auth(),
        super(AmplifyauthInitial());

  Future<void> signIn({String email, String password}) async {}

  Future<void> confirmedCode({String email, String code}) async {
    emit(AmplifyauthInitial());
    ServicesResult result = await _auth.confirmedCode(email: email, code: code);
    if (result.status) {
      emit(AmplifyauthSuccess(success: result.status.toString()));
    } else {
      emit(AmplifyauthError(error: result.status.toString()));
    }
  }

  Future<void> forgot({String email}) async {
    emit(AmplifyauthInitial());
    ServicesResult result =
        await _auth.forget(email: email);
    if (result.status == true) {
      print('estatus true ' + result.success);
      emit(AmplifyauthSuccess());
    } else {
      print('estatus false ' + result.error);
        emit(AmplifyauthError());
    }
  }

  Future<void> signUp({String email, String password}) async {
    emit(AmplifyauthInitial());
    ServicesResult result =
        await _auth.signUp(email: email, password: password);
    if (result.status == true) {
      print('estatus true ' + result.success);
        emit(AmplifyauthSuccess());
    } else {
      print('estatus false ' + result.error);
        emit(AmplifyauthError());
    }
  }
}
