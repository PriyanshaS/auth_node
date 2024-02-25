import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:node_auth/models/user.dart';

class UserProvider extends ChangeNotifier{
User _user = User(id: '', name: '', email:'' , token: '', password: '');

User get user => _user;

void setUser(String user){
   _user  = json.decode(user);
  notifyListeners();
}
void setUserFromModel(){
  _user = user;
  notifyListeners();
}

}