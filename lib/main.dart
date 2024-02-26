import 'dart:async';

import 'package:flutter/material.dart';
import 'package:node_auth/screens/home_screen.dart';
import 'package:node_auth/screens/login.dart';
import 'package:node_auth/providers/user_provider.dart';
import 'package:node_auth/screens/signup.dart';
import 'package:node_auth/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(_) => UserProvider(), )

    ],
    
    child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Node Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }

 
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   void initState() { 
    AuthService authService = AuthService();
    authService.getUserData(context);
    super.initState(); 
    whereToGo();
  } 
  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.white, 
      child:Column(
        children: [
          
          FlutterLogo(size:MediaQuery.of(context).size.height ),
        ],
      ) 
    );
  }
   void whereToGo()async{
    
    final prefs  = await SharedPreferences.getInstance();
    final token = prefs.getString('x-auth-token');
   
    Timer(Duration(seconds: 3),(){
      if(token!.isNotEmpty){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      }
      else Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
          }
         ); 
  
  }
}



