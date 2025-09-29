import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/dashboard.dart';
import 'package:food_mood_2/screen/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),));
}