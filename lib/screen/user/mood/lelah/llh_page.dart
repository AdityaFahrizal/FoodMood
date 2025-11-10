import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_mood_2/screen/admin/dashboard_admin.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/senang/resep.dart';
import 'package:food_mood_2/screen/dashboard.dart';
import 'package:food_mood_2/screen/user/resep.dart';

class LelahPage extends StatefulWidget {
  const LelahPage({super.key});

  @override
  State<LelahPage> createState() => _LelahPage();
}

class _LelahPage extends State<LelahPage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF714B),
        title: const Center(
          child: Text(
            "Food Mood",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 310,
                  height: 40,
                  child: SearchBar(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value.toLowerCase();
                      });
                    },
                    textInputAction: TextInputAction.search,
                    leading: const Icon(Icons.search),
                    hintText: "Cari di sini...",
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: IconButton(
                        icon: const Icon(Icons.filter_alt_outlined, size: 22),
                        onPressed: () async {
                          final result = await showMenu<String>(
                            context: context,
                            position: const RelativeRect.fromLTRB(
                              100,
                              80,
                              0,
                              0,
                            ),
                            items: const [
                              PopupMenuItem(value: 'All', child: Text('Semua')),
                              PopupMenuItem(
                                value: 'Makanan',
                                child: Text('Makanan'),
                              ),
                              PopupMenuItem(
                                value: 'Minuman',
                                child: Text('Minuman'),
                              ),
                            ],
                          );
                          if (result != null) {
                            setState(() {
                              selectedCategory = result;
                            });
                          }
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 33, left: 10),
                      child: Text(
                        "FILTER",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('menuMood')
                  .where('mood', isEqualTo: 'Senang')
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

                final allDocs = snapshot.data!.docs;

                final filteredDocs = allDocs
                    .where(
                      (doc) =>
                          selectedCategory == 'All' ||
                          (doc.data() as Map<String, dynamic>)['kategori'] ==
                              selectedCategory,
                    )
                    .where((doc) {
                      final data = doc.data() as Map<String, dynamic>;
                      final nama = (data['name'] ?? '')
                          .toString()
                          .toLowerCase();
                      final deskripsi = (data['description'] ?? '')
                          .toString()
                          .toLowerCase();
                      return searchQuery.isEmpty ||
                          nama.contains(searchQuery) ||
                          deskripsi.contains(searchQuery);
                    })
                    .toList();

                if (filteredDocs.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        Icon(
                          Icons.sentiment_dissatisfied,
                          size: 50,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Tidak ada data ditemukan.",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredDocs.length,
                  itemBuilder: (context, index) {
                    final doc = filteredDocs[index];
                    final data = doc.data() as Map<String, dynamic>;
                    final nama = data['name'] ?? 'Tanpa Nama';
                    final deskripsi = data['description'] ?? '';
                    final kategori = data['kategori'] ?? '';
                    final imageBase64 = data['imageBase64'];

                    final cardColor = kategori == "Minuman"
                        ? const Color(0xFF8BA3B2)
                        : const Color(0xFFA6B28B);

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 10,
                      ),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: imageBase64 != null
                                      ? Image.memory(
                                          base64Decode(imageBase64),
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                        )
                                      : const Icon(
                                          Icons.fastfood,
                                          size: 60,
                                          color: Colors.white,
                                        ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      right: 8,
                                      bottom: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              nama,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
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
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: SizedBox(
                                            height: 32,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                    ),
                                                backgroundColor: const Color(
                                                  0xFFFF714B,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => 
                                                    ResepUserPage()
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                "Lihat Detail",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
