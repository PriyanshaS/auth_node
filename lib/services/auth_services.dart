import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:node_auth/models/user.dart';
import 'package:node_auth/utils/utils.dart';

class AuthService {

  void signUpUser({required BuildContext context , required String email , required String password,required String name, }) async {
    try{
      User user = User(id: '', name: name, email: email, token: '', password: password);
      http.Response res = await http.post(
        Uri.parse('http://localhost:3000/api/signup'),
        body:jsonEncode(user),
        headers:<String , String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(response: res, context: context, onSuccess: (){
        showSnackBar(context, 'Account created! Login with the same credemtials!',);

      });
    }
    catch (e){
      showSnackBar(context,e.toString() );
    }

  }
}