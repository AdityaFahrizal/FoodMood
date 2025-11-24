import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/user/MyMenu/mymenu.dart';

class ResepMyMenuPage extends StatefulWidget {
  final String menuId;
  final Map<String, dynamic> menuData;

  const ResepMyMenuPage({
    super.key,
    required this.menuId,
    required this.menuData,
  });

  @override
  State<ResepMyMenuPage> createState() => _ResepMyMenuPageState();
}

class _ResepMyMenuPageState extends State<ResepMyMenuPage> {
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF714B),
        title: const Text(
          "Resep Menu",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MyMenuPage()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('menus')
            .doc(widget.menuId)
            .collection('resep')
            .orderBy('createdAt', descending: true)
            .snapshots(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "Belum ada resep",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          final resepList = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: resepList.length,
            itemBuilder: (context, index) {
              final data = resepList[index].data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['nama'] ?? 'Tanpa Nama',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      if (data['gambar'] != null)
                        Image.memory(
                          base64Decode(data['gambar']),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),

                      const SizedBox(height: 10),

                      Text(data['deskripsi'] ?? ''),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF714B),
        onPressed: () {
          // tinggal tambahkan halaman tambah resep user
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
