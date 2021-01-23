//import packages
import 'package:caterWorld/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import files
import './screens/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        //future: _initialization,
        stream: Firestore.instance.collection('dish_info').snapshots(),
        builder: (context, appSnapshot) {
          return MaterialApp(
            home: StreamBuilder(
                stream: FirebaseAuth.instance.onAuthStateChanged,
                builder: (ctx, userSnapshot) {
                  if (userSnapshot.hasData) {
                    return NavBar();
                  }
                  return AuthScreen();
                }),
          );
        });
  }
}
