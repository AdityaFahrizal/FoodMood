// import 'package:flutter/material.dart';
// import 'package:food_mood_2/screen/dashboard.dart';
// import 'package:food_mood_2/screen/register.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final TextEditingController _emailcotroler = TextEditingController();
//   final TextEditingController _passwordcotroler = TextEditingController();

//   bool _obscureText = true;
//   bool _isLoading = false;
//   String _message = "";

//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//       _message = "";
//     });

//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailcotroler.text.trim(),
//         password: _passwordcotroler.text.trim(),
//       );

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Home()),
//       );
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text("Login Gagal"),
//           content: const Text("Periksa kembali email dan password anda."),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 _emailcotroler.clear();
//                 _passwordcotroler.clear();
//               },
//               child: const Text("OK"),
//             ),
//           ],
//         ),
//       );

//       setState(() {
//         _message = "Login Gagal";
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(height: 45),
//             Image.asset("assets/images/background.png"),
//             const SizedBox(height: 100),
//             Center(
//               child: SizedBox(
//                 width: 350,
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   color: const Color.fromARGB(255, 231, 231, 231),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Text(
//                           "Login",
//                           style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                             fontStyle: FontStyle.italic,
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         TextField(
//                           controller: _emailcotroler,
//                           decoration: InputDecoration(
//                             label: const Text("Email"),
//                             prefixIcon: const Icon(Icons.person),
//                             hintText: "Masukan Email Kalian",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         TextField(
//                           controller: _passwordcotroler,
//                           obscureText: _obscureText,
//                           decoration: InputDecoration(
//                             label: const Text("Password"),
//                             prefixIcon: const Icon(Icons.lock),
//                             suffixIcon: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _obscureText = !_obscureText;
//                                 });
//                               },
//                               icon: Icon(
//                                 _obscureText
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                               ),
//                             ),
//                             hintText: "Masukan Password Kalian",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         _isLoading
//                             ? const CircularProgressIndicator()
//                             : ElevatedButton(
//                                 onPressed: _login,
//                                 child: const Text(
//                                   "Login",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                         const SizedBox(height: 15),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               "Belum Punya Akun?",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => const Register(),
//                                   ),
//                                 );
//                               },
//                               child: const Text(
//                                 "Register",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Text(_message),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
