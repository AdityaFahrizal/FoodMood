import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_mood_2/screen/user/resep_makanan/burger.dart';
import 'package:food_mood_2/screen/dashboard.dart';
import 'package:food_mood_2/screen/user/resep_minuman/milkshake.dart';
import 'package:food_mood_2/screen/user/mood/senang/mkn_sng.dart';
import 'package:food_mood_2/screen/user/mood/senang/mnm_sng.dart';

class SenangFood extends StatefulWidget {
  const SenangFood({super.key});

  @override
  State<SenangFood> createState() => _SenangFoodState();
}

class _SenangFoodState extends State<SenangFood> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> allMenuData = []; 
  List<Map<String, dynamic>> tampilMenu = [];

  @override
  void initState() {
    super.initState();
    tampilMenu = allMenuData;
  }

  void filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        tampilMenu = allMenuData;
      } else {
        tampilMenu = allMenuData
            .where((item) =>
                item["name"].toLowerCase().contains(query.toLowerCase()) ||
                item["description"].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Widget getMenuPage(String menuName) {
    if (menuName.toLowerCase().contains("burger")) {
      return const ResepBurger();
    } else if (menuName.toLowerCase().contains("milkshake")) {
      return const ResepMilkshake();
    }
    return const MakananSenang(); 
  }

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
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFFF714B),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  "Food Mood",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA6B28B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MakananSenang(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.fastfood, color: Colors.white, size: 25),
                          SizedBox(width: 10),
                          Text(
                            "Makanan",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 180,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8BA3B2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MinumanSenang(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_cafe, color: Colors.white, size: 25),
                          SizedBox(width: 10),
                          Text(
                            "Minuman",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              height: 40,
              child: TextField(
                controller: searchController,
                onChanged: filterSearch,
                decoration: InputDecoration(
                  hintText: "Cari di sini...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
            const Text(
              "Ini Ada Beberapa Rekomendasi Makanan..",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Text(
              "Semoga Kamu Suka Ya..",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),

            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('menuItems').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final List<Map<String, dynamic>> fetchedMenu = snapshot.data!.docs
                    .asMap()
                    .entries
                    .map((entry) {
                      final index = entry.key;
                      final data = entry.value.data()! as Map<String, dynamic>;
                      
                      data['warna'] = data['warna'] ?? (index.isEven ? const Color(0xFFA6B28B) : const Color(0xFF8BA3B2));
                      data['page'] = getMenuPage(data['name'] ?? ''); 
                      return data;
                    }).toList();

                if (fetchedMenu.length != allMenuData.length || searchController.text.isEmpty) {
                    allMenuData = fetchedMenu;
                    if (searchController.text.isEmpty) {
                       tampilMenu = fetchedMenu;
                    }
                }
                
                final List<Map<String, dynamic>> menuToDisplay = searchController.text.isEmpty ? allMenuData : tampilMenu;

                if (menuToDisplay.isEmpty && searchController.text.isEmpty) {
                  return const Center(child: Text('Belum ada menu di Firestore.'));
                } else if (menuToDisplay.isEmpty && searchController.text.isNotEmpty) {
                  return const Center(child: Text('Menu tidak ditemukan.'));
                }


                return Column(
                  children: menuToDisplay.map((item) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => item["page"]),
                        );
                      },
                      child: Container(
                        width: 380,
                        height: 100,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: item["warna"] ?? const Color(0xFFA6B28B), 
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                item["imageUrl"] ?? '', 
                                fit: BoxFit.cover,
                                width: 85,
                                height: 85,
                                errorBuilder: (context, error, stackTrace) => 
                                    const Icon(Icons.fastfood, size: 50, color: Colors.white), 
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item["name"] ?? 'Tidak Ada Nama',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    item["description"] ?? 'Tidak Ada Deskripsi',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}