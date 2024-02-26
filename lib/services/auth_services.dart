import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:node_auth/models/user.dart';
import 'package:node_auth/providers/user_provider.dart';
import 'package:node_auth/screens/home_screen.dart';
import 'package:node_auth/screens/signup.dart';
import 'package:node_auth/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthService {

  void signUpUser({required BuildContext context , required String email , required String password,required String name }) async {
    try{
      User user = User(id: '', name: name, email: email, token: '', password: password);
      http.Response res = await http.post(
        Uri.parse('https://node-auth-h8r2.onrender.com/api/signup'),
        body:jsonEncode(user),
        headers:<String , String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );



      httpErrorHandle(response: res, context: context, onSuccess: (){
        showSnackBar(context, 'Account created! Login with the same credentials!',);
      });
    }
    catch (e){
      showSnackBar(context,e.toString() );
    }
  }


  void signInUser({ required BuildContext context , required String email , required String password }) async{
    try{
      
     
      http.Response res = await http.post(Uri.parse('https://node-auth-h8r2.onrender.com/api/signin'),
      body: jsonEncode({
        "email" :email,
        "password" :password,
      }),
      headers:<String , String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

       httpErrorHandle(response: res, context: context, 
       onSuccess: ()  async{
        print(res.body);
        String name = jsonDecode(res.body)['name'];
        String _id = jsonDecode(res.body)['_id'];
        String token = jsonDecode(res.body)['token'];

        final prov = Provider.of<UserProvider>(context , listen: false);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        User user = new User(id:_id , name:name, email: email, token: token, password: password);
        prov.setUserFromModel(user);
        await prefs.setString('x-auth-token',token);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen(),), (route) => false);
        
       });
      
    }
    catch(e){
      showSnackBar(context, e.toString());
    }
  }


  void getUserData(BuildContext context) async{
    try {
      final prov = Provider.of<UserProvider>(context , listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
     
      if(token==null){
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
      Uri.parse('https://node-auth-h8r2.onrender.com/tokenIsValid'),
      
      headers:<String , String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
     );
      var response = jsonDecode(tokenRes.body);
     

      if(response == true){
        http.Response userRes = await http.get(
          Uri.parse('https://node-auth-h8r2.onrender.com/'),
          headers: <String , String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },);
        String name = jsonDecode(userRes.body)['name'];
        String _id = jsonDecode(userRes.body)['_id'];
        String email = jsonDecode(userRes.body)['email'];
        String password = jsonDecode(userRes.body)['password'];
        
        prov.setUserFromModel(User(id: _id, name: name, email: email, token: token, password: password));
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }

  }
  void signOut(BuildContext context)async{
    final prefs =await SharedPreferences.getInstance();
    prefs.setString('x-auth-token' , '');
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Signup(),), (route) => false);

  }
}