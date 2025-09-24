import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailcotroler = TextEditingController();
  final TextEditingController _passwordcotroler = TextEditingController();

  void _register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcotroler.text,
        password: _passwordcotroler.text,
      );
      setState(() {
        _message = " Register Berhasil!"; 
      });
    } catch (e) {
      setState(() {
        _message = "Register Gagal $e";
      });
    }
  }

  void _login() async { 
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcotroler.text,
        password: _passwordcotroler.text,
      );
      setState(() {
        _message = "Login Berhasil!"; 
      });
    } catch (e) {
      setState(() {
        _message = "Login Gagal $e";
      });
    }
  }

  String _message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase Auth")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _emailcotroler,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordcotroler,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _register, child: Text("Register")),
            ElevatedButton(onPressed: _login, child: Text("Login")),
            SizedBox(height: 20),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
