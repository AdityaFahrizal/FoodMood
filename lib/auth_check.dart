import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/admin/dashboard_admin.dart';
import 'package:food_mood_2/screen/auth/login.dart';
import 'package:food_mood_2/screen/dashboard.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  authcheck() async {
    final user = FirebaseAuth.instance.currentUser;
    
    print("Tanda di atas");
    if (user == null ) {
      print(user);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }

    else {
      final data = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (data.data()!['Role'] == 'admin') {
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Admin()));
      }

      else {
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }

  @override
  void initState() {
    authcheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CircularProgressIndicator());
  }
}
