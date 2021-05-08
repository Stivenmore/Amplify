import 'package:flutter/material.dart';

abstract class Services {}

class ServicesResult<T>{
  @required
  bool status;

  T data;
  String error;
  String success;

  ServicesResult({this.data, this.error, this.status, this.success});
}
