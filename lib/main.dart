import 'package:flutter/material.dart';
import 'package:node_auth/screens/login.dart';
import 'package:node_auth/providers/user_provider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(_) => UserProvider(), )

    ],
    
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Node Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage() ,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}

