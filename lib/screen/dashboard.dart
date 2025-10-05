import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/user/mood/bosan/bsn_page.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/comfortfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/dietfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/healtyfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/junkfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/organicfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/pastryfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/processedfppd.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/sweetsfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/wholefood.dart';
import 'package:food_mood_2/screen/user/mood/lelah/llh_page.dart';
import 'package:food_mood_2/screen/user/mood/marah/mrh_page.dart';
import 'package:food_mood_2/screen/auth/profile.dart';
import 'package:food_mood_2/screen/menu.dart';
import 'package:food_mood_2/screen/user/mood/sedih/sdh_page.dart';
import 'package:food_mood_2/screen/user/mood/senang/sng_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
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
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text("My Menu"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyMenu()),
                );
              },
            ),
            const ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favorit"),
            ),
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
                "Mood Kamu Lagi Kaya Gimana Nih..",
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
                      MaterialPageRoute(builder: (context) => SenangFood()),
                    );
                  }),
                  _buildMoodButton("😭", "Sedih", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SedihPage()),
                    );
                  }),
                  _buildMoodButton("😡", "Marah", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MarahFood()),
                    );
                  }),
                  _buildMoodButton("😕", "Lelah", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LelahFood()),
                    );
                  }),
                  _buildMoodButton("😩", "Bosan", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BosanFood()),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Atau Mau Cari Resep Makanan Nih..",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),

            _buildFoodCard(
              context,
              title: "Junk Food",
              image: "assets/images/kategori_makanan/JunkFood.jpg",
              page: Junkfood(),
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
          ],
        ),
      ),
    );
  }

  Widget _buildMoodButton(String emoji, String label, VoidCallback onTap) {
    return SizedBox(
      width: 65,
      height: 100,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 35)),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
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