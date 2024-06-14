import 'package:flutter/material.dart';

class LoggedUser extends ChangeNotifier{
  String? _idUser;
  String? _username;
  String? _cargo;
  String? _senha;

  String? get idUser => _idUser;
  String? get username => _username;
  String? get cargo => _cargo;
  String? get senha => _senha;

  void logUser(idUser, username, cargo){
    _idUser = idUser;
    _username = username;
    _cargo = cargo;
    notifyListeners();
  }
}