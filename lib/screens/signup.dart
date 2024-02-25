import 'package:flutter/material.dart';
import 'package:node_auth/screens/login.dart';
import 'package:node_auth/services/auth_services.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key, }) : super(key: key);
  


  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final AuthService authService = AuthService();

  void signUpUser(){
    authService.signUpUser(context: context, email: emailController.text, password: passwordController.text, name: nameController.text);
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up') ,
      centerTitle: true, 
      backgroundColor: Colors.purple[200] ,
      automaticallyImplyLeading: false,) ,
      body
      : Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
             SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: nameController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText:'Name'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:(name) {
                  if(name !=  null)
                  return 'Enter a valid name';
                  else
                  return null;
                }
                
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText:'Email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:(email) {
                  if(email !=  null)
                  return 'Enter a valid email';
                  else
                  return null;
                }
                
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText:'Password'),
                obscureText: true,
                validator: (value) {
                  if(value != null && value.length <6)
                  {return 'Enter min. 6 characters';}
                  else
                  {return null;}
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: signUpUser,
                icon: Icon(
                  Icons.lock_open,
                  size: 32,
                ),
                label: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              ),
              SizedBox(
                height: 24,
              ),
                 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
              Text('Already a user?'),
              GestureDetector(child: Text('Log In'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
              },),
            ],)
            ],
          ),
        ),
      ),
    );
  }

 
}
