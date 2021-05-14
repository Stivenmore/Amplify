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

  Future signIn({String email, String password}) async {
    emit(AmplifyauthInitial());
    ServicesResult result =
        await _auth.signIn(email: email, password: password);
    if (result.status) {
      emit(AmplifyauthSuccess());
    } else {
      emit(AmplifyauthError());
    }
  }

  Future confirmedCode({String email, String code}) async {
    emit(AmplifyauthInitial());
    ServicesResult result = await _auth.confirmedCode(email: email, code: code);
    print('El estado es ' + result.status.toString());
    if (result.status) {
      emit(AmplifyauthSuccess(success: result.status.toString()));
    } else {
      emit(AmplifyauthError(error: result.status.toString()));
    }
    return result.status;
  }

  Future forgot({String email}) async {
    emit(AmplifyauthInitial());
    ServicesResult result = await _auth.forget(email: email);
    if (result.status == true) {
      print('estatus true ' + result.success);
      emit(AmplifyauthSuccess());
    } else {
      print('estatus false ' + result.error);
      emit(AmplifyauthError());
    }
  }

  Future resetcode({String email}) async {
    emit(AmplifyauthInitial());
    ServicesResult result = await _auth.resetCode(email: email);
    if (result.status) {
      print('status true' + result.success);
      emit(AmplifyauthSuccess());
    } else {
       print('estatus false ' + result.error);
      emit(AmplifyauthError());
    }
  }

  Future signUp({String email, String password}) async {
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
    return result.status;
  }
}
