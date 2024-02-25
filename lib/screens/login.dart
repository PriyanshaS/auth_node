import 'package:flutter/material.dart';
import 'package:node_auth/screens/signup.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Log In') ,
      centerTitle: true, 
      backgroundColor: Colors.purple[200] ,
      automaticallyImplyLeading: false,) ,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              ),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 4),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                
              },
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
            GestureDetector(
              child: Text('Forgot Password? ',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),
              ),
              
            )
,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
              Text('No Account?'),
              GestureDetector(child: Text('Sign Up'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup(),));
              },),
            ],)
          ],
        ),
      ),
    );
  }
}
