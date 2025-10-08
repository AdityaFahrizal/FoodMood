import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/admin/kategori%20makanan/junk%20food/junk_food_page.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/bosan/bosan_page.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/lelah/lelah_page.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/marah/marah_page.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/sedih/sedih_page.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/senang/senang_page.dart';
import 'package:food_mood_2/screen/auth/profile.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/comfortfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/dietfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/healtyfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/junkfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/organicfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/pastryfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/processedfppd.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/sweetsfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/wholefood.dart';

class Home_Admin extends StatefulWidget {
  const Home_Admin({super.key});

  @override
  State<Home_Admin> createState() => _Home_AdminState();
}

class _Home_AdminState extends State<Home_Admin> {
  String? selectedValue;

  final List<String> items = [
    'Senang',
    'Sedih',
    'Marah',
    'Lelah',
    'Bosan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFFF714B),
        title: const Text(
          "Food Mood",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        automaticallyImplyLeading: false,
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
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFFF714B),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  "Admin Food Mood",
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home_Admin()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
            ),
            DropdownButton<String>(
          hint: const Text("Page Mood"),
          value: selectedValue,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
            });

            if (newValue == "Senang") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SenangPageAdmin()),
              );
            } else if (newValue == 'Sedih') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SedihPageAdmin()),
              );
            } else if (newValue == 'Marah') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MarahPageAdmin()),
              );
            }
            else if (newValue == 'Lelah') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LelahPageAdmin()),
              );
            }
            else if (newValue == 'Bosan') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BosanPageAdmin()),
              );
            }
          },
            ),
            DropdownButton<String>(
          hint: const Text("Kategory Food"),
          value: selectedValue,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
            });

            if (newValue == "Junk Food") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SenangPageAdmin()),
              );
            } else if (newValue == 'Healty Food') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SedihPageAdmin()),
              );
            } else if (newValue == 'Whole Food') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MarahPageAdmin()),
              );
            }
            else if (newValue == 'Processed Food') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LelahPageAdmin()),
              );
            }
            else if (newValue == 'Comfort Food') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BosanPageAdmin()),
              );
            }
            else if (newValue == 'Diet Food') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BosanPageAdmin()),
              );
            }
            else if (newValue == 'Pastry Food') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BosanPageAdmin()),
              );
            }
            else if (newValue == 'Sweets Food') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BosanPageAdmin()),
              );
            }
          },
            )
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Admin Page ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMoodButton("😁", "Senang", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SenangPageAdmin()),
                    );
                  }),
                  _buildMoodButton("😭", "Sedih", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SedihPageAdmin()),
                    );
                  }),
                  _buildMoodButton("😡", "Marah", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MarahPageAdmin()),
                    );
                  }),
                  _buildMoodButton("😕", "Lelah", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LelahPageAdmin()),
                    );
                  }),
                  _buildMoodButton("😩", "Bosan", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BosanPageAdmin()),
                    );
                  }),
                ],
              ),
            ),

            _buildFoodCard(
              context,
              title: "Junk Food",
              image: "assets/images/kategori_makanan/JunkFood.jpg",
              page: JunkFoodPageAdmin(),
            ),
            _buildFoodCard(
              context,
              title: "Healty Food",
              image: "assets/images/kategori_makanan/healtyfood.jpg",
              page: Healtyfood(),
            ),
            _buildFoodCard(
              context,
              title: "Whole Food",
              image: "assets/images/kategori_makanan/wholefood.jpg",
              page: Wholefood(),
            ),
            _buildFoodCard(
              context,
              title: "Processed Food",
              image: "assets/images/kategori_makanan/prosesfood.jpg",
              page: Processedfood(),
            ),
            _buildFoodCard(
              context,
              title: "Organic Food",
              image: "assets/images/kategori_makanan/organicfood.jpg",
              page: Organicfood(),
            ),
            _buildFoodCard(
              context,
              title: "Comfort Food",
              image: "assets/images/kategori_makanan/Confortfood.jpg",
              page: Comfortfood(),
            ),
            _buildFoodCard(
              context,
              title: "Diet Food",
              image: "assets/images/kategori_makanan/dietfood.jpg",
              page: Dietfood(),
            ),
            _buildFoodCard(
              context,
              title: "Pastry Food",
              image: "assets/images/kategori_makanan/pastryfood.jpg",
              page: Pastryfood(),
            ),
            _buildFoodCard(
              context,
              title: "Sweets Food",
              image: "assets/images/kategori_makanan/sweetsfood.jpg",
              page: Sweetsfood(),
            ),

            const SizedBox(height: 15),

          ]
        ),
      ),
    );
  }

  Widget _buildMoodButton(String emoji, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.16,
        height: MediaQuery.of(context).size.height * 0.11,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                emoji,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodCard(
    BuildContext context, {
    required String title,
    required String image,
    required Widget page,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        width: 380,
        height: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 5,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page),
                    );
                  },
                  child: const Text(
                    "see details",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
