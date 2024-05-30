import 'package:flutter/material.dart';

class LoggedUser extends ChangeNotifier{
  int? _idUser;
  String? _username;
  String? _cargo;
  String? _senha;

  int? get idUser => _idUser;
  String? get username => _username;
  String? get cargo => _cargo;
  String? get senha => _senha;

  void logUser(username, cargo){
    _username = username;
    _cargo = cargo;
    notifyListeners();
  }
}