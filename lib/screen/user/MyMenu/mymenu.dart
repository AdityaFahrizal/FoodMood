import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_mood_2/screen/dashboard.dart';
import 'package:food_mood_2/screen/user/MyMenu/resep_mymenu.dart';
import 'package:food_mood_2/screen/user/MyMenu/tambah_menu_usr.dart';

class MyMenuPage extends StatefulWidget {
  const MyMenuPage({super.key});

  @override
  State<MyMenuPage> createState() => _MyMenuPageState();
}

class _MyMenuPageState extends State<MyMenuPage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF714B),
        title: const Text(
          "My Menu",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF714B),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>TambahMenuUserPage()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 40,
                  child: SearchBar(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value.toLowerCase();
                      });
                    },
                    hintText: "Cari menu...",
                    leading: const Icon(Icons.search),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_alt_outlined),
                  onPressed: () async {
                    final result = await showMenu<String>(
                      context: context,
                      position: const RelativeRect.fromLTRB(200, 150, 0, 0),
                      items: const [
                        PopupMenuItem(value: 'All', child: Text('Semua')),
                        PopupMenuItem(value: 'Makanan', child: Text('Makanan')),
                        PopupMenuItem(value: 'Minuman', child: Text('Minuman')),
                      ],
                    );

                    if (result != null) {
                      setState(() => selectedCategory = result);
                    }
                  },
                )
              ],
            ),

            const SizedBox(height: 20),

            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('mymenuUser')
                  .doc(currentUserId)
                  .collection('menus')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        Icon(Icons.fastfood, size: 60, color: Colors.grey),
                        SizedBox(height: 15),
                        Text(
                          "Belum ada menu ditambahkan",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;

                    final nama = data['name'] ?? 'Tanpa Nama';
                    final deskripsi = data['description'] ?? '';
                    final kategori = data['kategori'] ?? '';
                    final imageBase64 = data['imageBase64'];

                    final cardColor = kategori == "Minuman"
                        ? const Color(0xFF8BA3B2)
                        : const Color(0xFFA6B28B);

                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: imageBase64 != null
                                  ? Image.memory(
                                      base64Decode(imageBase64),
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(Icons.fastfood,
                                      size: 60, color: Colors.white),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nama,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    deskripsi,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios,
                                  color: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResepMyMenuPage(menuId: 'MyMenu',
                                      menuData: data,
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
