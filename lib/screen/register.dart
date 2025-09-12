import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50)),
            Image.asset("assets/images/background.png"),
            Padding(padding: EdgeInsets.only(top: 100)),
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
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),

                      //usn
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          decoration: InputDecoration(
                            label: Text("Username"),
                            prefixIcon: Icon(Icons.person),
                            hintText: "Masukan Username Kalian",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      
                      //email
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          decoration: InputDecoration(
                            label: Text("Email"),
                            prefixIcon: Icon(Icons.mail),
                            hintText: "Masukan Email Kalian",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),

                      //password
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            label: Text("Password"),
                            prefixIcon: Icon(Icons.lock),
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

                      //button
                      Padding(padding: EdgeInsets.only(top: 20)),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Register",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sudah Punya Akun?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        )
      ),
    );
  }
}