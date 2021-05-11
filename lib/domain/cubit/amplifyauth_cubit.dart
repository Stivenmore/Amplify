import 'package:amplify/data/repository/Auth.dart';
import 'package:amplify/domain/entities/Users.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'amplifyauth_state.dart';

class AmplifyauthCubit extends Cubit<AmplifyauthState> {
  Auth _auth;
  AmplifyauthCubit({Auth auth}) : _auth= auth?? Auth(), super(AmplifyauthInitial());

  Future<void> signIn() async{

  }

  Future<void> signUp() async{
    
  }
}
