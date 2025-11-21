import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_mood_2/screen/admin/dashboard_admin.dart';
import 'package:food_mood_2/screen/admin/edit_menu.dart';
import 'package:food_mood_2/screen/admin/kategori%20makanan/whole%20food/resep_wf.dart';
import 'package:food_mood_2/screen/admin/tambah_menu.dart';

class WholeFoodPageAdmin extends StatefulWidget {
  const WholeFoodPageAdmin({super.key});

  @override
  State<WholeFoodPageAdmin> createState() => _WholeFoodPageAdminState();
}

class _WholeFoodPageAdminState extends State<WholeFoodPageAdmin> {
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
              MaterialPageRoute(builder: (context) => Home_Admin()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.device_hub, color: Colors.transparent),
          ),
        ],
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
                            position:
                                const RelativeRect.fromLTRB(100, 80, 0, 0),
                            items: const [
                              PopupMenuItem(
                                  value: 'All', child: Text('Semua')),
                              PopupMenuItem(
                                  value: 'Makanan', child: Text('Makanan')),
                              PopupMenuItem(
                                  value: 'Minuman', child: Text('Minuman')),
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
                  .where('mood', isEqualTo: 'WholeFood')
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
                        Icon(Icons.fastfood,
                            size: 60, color: Colors.grey),
                        SizedBox(height: 15),
                        Text(
                          "Belum ada menu ditambahkan",
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey),
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
                      final nama =
                          (data['name'] ?? '').toLowerCase();
                      final deskripsi =
                          (data['description'] ?? '').toLowerCase();
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
                        Icon(Icons.sentiment_dissatisfied,
                            size: 50, color: Colors.grey),
                        SizedBox(height: 10),
                        Text("Tidak ada data ditemukan.",
                            style: TextStyle(color: Colors.grey)),
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
                    final imageBase64 = data['imageBase64'];

                    final cardColor = Colors.white;

                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: imageBase64 != null
                                      ? Image.memory(
                                          base64Decode(imageBase64),
                                          fit: BoxFit.cover,
                                          width: 90,
                                          height: 90,
                                        )
                                      : const Icon(
                                          Icons.fastfood,
                                          size: 60,
                                          color: Colors.grey,
                                        ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 8, bottom: 8),
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
                                              overflow:
                                                  TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              deskripsi,
                                              maxLines: 2,
                                              overflow:
                                                  TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ],
                                        ),

                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: SizedBox(
                                            height: 28,
                                            child: ElevatedButton(
                                              style:
                                                  ElevatedButton.styleFrom(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 10),
                                                backgroundColor:
                                                    const Color(
                                                        0xFFFF714B),
                                                shape:
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                ),
                                              ),
                                              onPressed: () {
                                                final enrichedData = {
                                                  ...data,
                                                  'menuId': doc.id,
                                                  'docId': doc.id,
                                                  'mood': 'WholeFood',
                                                };

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResepWholeFoodAdminPage(
                                                            menuData:
                                                                enrichedData),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                "Lihat Detail",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
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

                            Positioned(
                              right: 0,
                              top: 0,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditMenuMoodPage(
                                            docId: doc.id,
                                            data: data,
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.edit,
                                        color: Color(0xFF007BFF)),
                                  ),

                                  IconButton(
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection('menuMood')
                                          .doc(doc.id)
                                          .delete();
                                    },
                                    icon: const Icon(Icons.delete,
                                        color: Color(0xFFDC3545)),
                                  ),
                                ],
                              ),
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

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF714B),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TambahMenuMoodPage(mood: 'WholeFood'),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
