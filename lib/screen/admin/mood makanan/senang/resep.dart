import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/senang/senang_page.dart';
import 'package:food_mood_2/screen/admin/tambah_resep.dart';

class ResepSenangPage extends StatefulWidget {
  final Map<String, dynamic> menuData;
  const ResepSenangPage({super.key, required this.menuData});

  @override
  State<ResepSenangPage> createState() => _ResepSenangPageState();
}

class _ResepSenangPageState extends State<ResepSenangPage> {
  @override
  Widget build(BuildContext context) {
    final menuData = widget.menuData;
    final String moodName =
        (menuData['mood'] ?? menuData['kategori'] ?? 'Senang').toString();
    final String menuId =
        (menuData['id'] ?? menuData['docId'] ?? menuData['menuId'] ?? '')
            .toString();



    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF714B),
        title: const Text(
          "Food Mood",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SenangPageAdmin()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('resep')
            .where('menuId', isEqualTo: menuId)
            .orderBy('timestamp', descending: true)
            .snapshots(),

            
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fastfood, size: 80, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    "Resep tidak ditemukan",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          final resepList = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: resepList.length,
            itemBuilder: (context, index) {
              final data = resepList[index].data() as Map<String, dynamic>;
              final docId = resepList[index].id;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blueAccent),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TambahResepPage(
                                moodName: moodName,
                                docId: docId,
                                menuData: menuData,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('resep')
                              .doc(docId)
                              .delete();
                        },
                      ),
                    ],
                  ),

                  Container(
                    width: double.infinity,
                    color: const Color(0xFFFF714B),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        if (data['gambar'] != null && data['gambar'] != '')
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.memory(
                              base64Decode(data['gambar']),
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),

                        const SizedBox(height: 12),

                        Text(
                          data['nama'] ?? 'Tanpa Nama',
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),

                        Text(
                          data['deskripsi'] ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.4,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),

                        if (data['waktu'] != null && data['waktu'] != '')
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 18,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                data['waktu'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),

                  const Text(
                    "Bahan-bahan:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    data['bahan'] ?? '-',
                    style: const TextStyle(fontSize: 15, height: 1.6),
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    "Langkah-langkah:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  if (data['langkah'] != null)
                    Column(
                      children: List.generate(
                        (data['langkah'] as List).length,
                        (stepIndex) {
                          final step = data['langkah'][stepIndex];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${stepIndex + 1}. ${step['text'] ?? '-'}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    height: 1.4,
                                  ),
                                ),
                                if (step['image'] != null &&
                                    step['image'] != '')
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.memory(
                                        base64Decode(step['image']),
                                        width: double.infinity,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                  const Divider(thickness: 1.2, height: 30),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF714B),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TambahResepPage(moodName: moodName, menuData: menuData),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
