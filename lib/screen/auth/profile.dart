import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_mood_2/screen/auth/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "";
  String email = "";
  String? photoBase64;
  bool isLoading = false;

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
          photoBase64 = data['photoBase64'];
        });
      }
    } catch (e) {
    }
  }

  Future<void> _pickAndSaveImage() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      final picker = ImagePicker();
      final pickedFile =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

      if (pickedFile == null) return;

      setState(() {
        isLoading = true;
      });

      File file = File(pickedFile.path);

      List<int> imageBytes = await file.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({'photoBase64': base64Image});

      setState(() {
        photoBase64 = base64Image;
        isLoading = false;
      });
    } catch (e) {
      print("Error simpan foto: $e");
      setState(() {
        isLoading = false;
      });
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
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.orange,
                    backgroundImage: (photoBase64 != null)
                        ? MemoryImage(base64Decode(photoBase64!))
                        : null,
                    child: (photoBase64 == null)
                        ? const Icon(Icons.person,
                            size: 70, color: Colors.white)
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.black),
                      onPressed: _pickAndSaveImage,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text("Nama: $username",
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Email: $email", style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Container(
              width: 150,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.redAccent),
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => const Login()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.white),
                    SizedBox(width: 5),
                    Text("Logout", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
