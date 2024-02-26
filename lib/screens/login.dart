import 'package:flutter/material.dart';
import 'package:node_auth/screens/signup.dart';
import 'package:node_auth/services/auth_services.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void loginUser(){
    authService.signInUser(context: context, email: emailController.text, password: passwordController.text);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('LOG IN') ,
      centerTitle: true, 
     
      automaticallyImplyLeading: false,) ,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                ),
              TextField(
                controller: emailController,
                cursorColor: Colors.white,
            
                decoration: InputDecoration(border :OutlineInputBorder() , labelText: 'Email'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
                
                onPressed:loginUser,
                icon: Icon(
                  Icons.lock_open,
                  color: Colors.grey[500],
                  size: 32,
                ),
                label: Text(
                  'LOG IN',
                  style: TextStyle(fontSize: 24 , color: Colors.grey[500]),
                ),
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50),shape: BeveledRectangleBorder(),
                backgroundColor: Colors.black),
              ),
              SizedBox(
                height: 24,
              ),
              
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                Text('No Account?  '),
                GestureDetector(child: Text('SIGN UP'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup(),));
                },),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
