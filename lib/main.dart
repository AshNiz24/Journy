import 'package:flutter/material.dart';
import 'screens/welcomScreen.dart';
//import 'screens/addEntryScreen.dart';
//import 'screens/readEntryScreen.dart';
//import 'screens/readListScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      home: WelcomeScreen(),
    ),
  );
}
