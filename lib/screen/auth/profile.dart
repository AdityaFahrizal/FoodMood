import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/auth/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        final data = snapshot.data() as Map<String, dynamic>;

        setState(() {
          username = data['Nama'] ?? 'Tidak ada';
          email = data['Email'] ?? user.email!;
        });
      }
    } catch (e) {
      print("Error ambil data user: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xFFFF714B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.orange,
                child: Icon(Icons.person, size: 70, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text("Nama: $username",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Email: $email", style: const TextStyle(fontSize: 16)),
            SizedBox(height: 455,),
            Container(
              width: 150,
              height: 50,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent
                      ),
                      onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    }, child: Row(
                      children: [
                        Icon(Icons.logout),Text("Logout")
                      ],
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
