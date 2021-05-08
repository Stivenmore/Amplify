part of 'amplifyauth_cubit.dart';

abstract class AmplifyauthState extends Equatable {
  const AmplifyauthState();

  @override
  List<Object> get props => [];
}

class AmplifyauthInitial extends AmplifyauthState {}

class AmplifyauthLoaded extends AmplifyauthState {
  final List<Users> users;

  AmplifyauthLoaded({this.users});
  @override
  List<Object> get props => [users];
}

class AmplifyauthError extends AmplifyauthState {
  final String error;

  AmplifyauthError({this.error});
  @override
  List<Object> get props => [error];
}

class AmplifyauthSuccess extends AmplifyauthState {
   final String success;

  AmplifyauthSuccess({this.success});
  @override
  List<Object> get props => [success];
}
