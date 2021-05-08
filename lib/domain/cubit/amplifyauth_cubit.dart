import 'package:amplify/domain/entities/Users.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'amplifyauth_state.dart';

class AmplifyauthCubit extends Cubit<AmplifyauthState> {
  AmplifyauthCubit() : super(AmplifyauthInitial());
}
