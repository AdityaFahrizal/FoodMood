import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/admin/dashboard_admin.dart';
import 'package:food_mood_2/screen/dashboard.dart';
import 'package:food_mood_2/screen/auth/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailcotroler = TextEditingController();
  final TextEditingController _passwordcotroler = TextEditingController();

  String _message = "";
  bool _obscureText = true;
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
      _message = "";
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailcotroler.text,
            password: _passwordcotroler.text,
          );
      String uid = userCredential.user!.uid;

      String role = 'user';
      if (_emailcotroler.text.toLowerCase().endsWith('@admin.com')) {
        role = 'admin';
      } else {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .get();

        if (userDoc.exists && userDoc.data() != null) {
          final data = userDoc.data() as Map<String, dynamic>;

          if (data.containsKey('role') && data['role'] is String) {
            role = data['role'];
          }
        }
      }

      if (role == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home_Admin()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }

      setState(() {
        _isLoading = false;
        _message = "Login Berhasil!";
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
      });

      String errorMessage =
          "Terjadi kesalahan. Silakan cek email dan password Anda.";

      if (e.code == 'user-not-found') {
        errorMessage = "Pengguna dengan email ini tidak ditemukan!";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Password salah!";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Format email tidak valid!";
      }

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Login Gagal"),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
        String errorMessage = e.toString().contains("tidak ditemukan")
            ? "Login berhasil, namun data peran tidak lengkap. Masuk sebagai User biasa."
            : "Login gagal: ${e.toString()}";

        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Login Gagal Total"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
        _message = "Terjadi kesalahan serius.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 45)),
              Image.asset("assets/images/background.png"),
              const Padding(padding: EdgeInsets.only(top: 100)),
              Center(
                child: SizedBox(
                  width: 350,
                  height: 420,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 231, 231, 231),
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),

                        const Padding(padding: EdgeInsets.only(top: 15)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextField(
                            controller: _emailcotroler,
                            decoration: InputDecoration(
                              label: const Text("Email"),
                              prefixIcon: const Icon(Icons.mail),
                              hintText: "Masukan Email Kalian",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),

                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextField(
                            controller: _passwordcotroler,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              label: const Text("Password"),
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              hintText: "Masukan Password Kalian",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 220),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: _login,
                                child: const Text(
                                  "Login",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),

                        const Padding(padding: EdgeInsets.only(top: 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Belum Punya Akun?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Register(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(_message),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
