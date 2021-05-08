import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final String email;
  final String password;
  final String name;
  final String phone;

  Users({this.name, this.phone, this.email, this.password});

  factory Users.fromAmplity(Map<String, dynamic> snapshot) => Users(
      email: snapshot['email'],
      password: snapshot['password'],
      name: snapshot['name'],
      phone: snapshot['phone'],
      );
  @override
  List<Object> get props => [email, password, phone, name];
}
