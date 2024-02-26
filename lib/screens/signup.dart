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
      appBar: AppBar(title: Text('SIGN UP') ,
      centerTitle: true, 
     
      automaticallyImplyLeading: false,) ,
      body
      : Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                TextFormField(
                
                  controller: nameController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(border: OutlineInputBorder() , hintText: 'Name',),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:(name) {
                    if(name !=  null)
                    return 'Enter a valid name';
                    else
                    return null;
                  }
                  
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(border: OutlineInputBorder() ,labelText:'Email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:(email) {
                    if(email !=  null)
                    return 'Enter a valid email';
                    else
                    return null;
                  }
                  
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(border: OutlineInputBorder() ,labelText:'Password'),
                  obscureText: true,
                  validator: (value) {
                    if(value != null && value.length <6)
                    {return 'Enter min. 6 characters';}
                    else
                    {return null;}
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(
                  
                  onPressed: signUpUser,
                  icon: Icon(
                    Icons.lock_open,
                    color: Colors.grey[500],
                    size: 32,
                  ),
                  label: Text(
                    'SIGN UP',
                    style: TextStyle(fontSize: 24 , color: Colors.grey[500]),
                  ),
                  style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50) , shape: BeveledRectangleBorder(),
                  backgroundColor: Color.fromARGB(255, 25, 24, 24)),
                ),
                SizedBox(
                  height: 24,
                ),
                   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                Text('Already a User?  '),
                GestureDetector(child: Text('LOG IN'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
                },),
              ],)
              ],
            ),
          ),
        ),
      ),
    );
  }

 
}
