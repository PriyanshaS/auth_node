import 'package:flutter/material.dart';
import 'package:node_auth/providers/user_provider.dart';
import 'package:node_auth/services/auth_services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void signOutUser(BuildContext context){
    AuthService().signOut(context);
  }
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are logged in , ${prov.user.name}' , style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text('Details : EMAIL - ${prov.user.email}' , style: TextStyle(fontSize: 15),),
            Text('ID-   ${prov.user.id}' , style: TextStyle(fontSize: 15),),
        
        
            SizedBox(height: 20,),
              ElevatedButton.icon(
                
                onPressed:() => signOutUser(context),
                icon: Icon(
                  Icons.keyboard_return,
                  size: 32,
                  color: Colors.grey[500],
                ),
                label: Text(
                  'SIGN OUT',
                  style: TextStyle(fontSize: 18 , color: Colors.grey[500]),
                ),
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50) , shape: BeveledRectangleBorder() ,backgroundColor: Colors.black),
              ),
          ],
          
        
        )),
      ),
    );
  }
}