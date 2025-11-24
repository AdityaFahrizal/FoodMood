import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/admin/kategori%20makanan/comfort%20food/comfort_food_page.dart';
import 'package:food_mood_2/screen/admin/kategori%20makanan/diet%20food/diet_food_page.dart';
import 'package:food_mood_2/screen/admin/kategori%20makanan/healty%20food/healty_food_page.dart';
import 'package:food_mood_2/screen/admin/kategori%20makanan/junk%20food/junk_food_page.dart';
import 'package:food_mood_2/screen/admin/kategori%20makanan/organic%20food/organic_food_page.dart';
import 'package:food_mood_2/screen/admin/kategori%20makanan/pasty%20food/pastry_food_page.dart';
import 'package:food_mood_2/screen/admin/kategori%20makanan/processed%20food/processed_food_page.dart';
import 'package:food_mood_2/screen/admin/kategori%20makanan/sweets%20food/sweets_food_page.dart';
import 'package:food_mood_2/screen/admin/kategori%20makanan/whole%20food/whole_food_page.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/bosan/bosan_page.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/lelah/lelah_page.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/marah/marah_page.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/sedih/sedih_page.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/senang/senang_page.dart';
import 'package:food_mood_2/screen/auth/profile.dart';
import 'package:food_mood_2/screen/dashboard.dart';

// ignore: camel_case_types
class Home_Admin extends StatefulWidget {
  const Home_Admin({super.key});

  @override
  State<Home_Admin> createState() => _Home_AdminState();
}

// ignore: camel_case_types
class _Home_AdminState extends State<Home_Admin> {
  final Map<String, Widget Function()> jenisMood = {
    'Senang': () => SenangPageAdmin(),
    'Sedih': () => SedihPageAdmin(),
    'Marah': () => MarahPageAdmin(),
    'Lelah': () => LelahPageAdmin(),
    'Bosan': () => BosanPageAdmin(),
  };

  final Map<String, Widget Function()> jenisMakanan = {
    'Junk Food': () => SenangPageAdmin(),
    'Healty Food': () => SedihPageAdmin(),
    'Whole Food': () => MarahPageAdmin(),
    'Processed Food': () => LelahPageAdmin(),
    'Diet Food': () => BosanPageAdmin(),
    'Comfort Food': () => BosanPageAdmin(),
    'Organic Food': () => BosanPageAdmin(),
    'Pasrty Food': () => BosanPageAdmin(),
    'Sweets Food': () => BosanPageAdmin(),
  };

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
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home User"),
              onTap: () {
                Navigator.pushReplacement(
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
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SenangPageAdmin(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 75,
                      height: 105,
                      child: Card(
                        shadowColor: const Color.fromARGB(255, 43, 43, 43),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text("😁", style: TextStyle(fontSize: 40)),
                            Text(
                              "Senang",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SedihPageAdmin(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 75,
                      height: 105,
                      child: Card(
                        shadowColor: const Color.fromARGB(255, 43, 43, 43),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text("😭", style: TextStyle(fontSize: 40)),
                            Text(
                              "Sedih",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MarahPageAdmin(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 75,
                      height: 105,
                      child: Card(
                        shadowColor: const Color.fromARGB(255, 43, 43, 43),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text("😡", style: TextStyle(fontSize: 40)),
                            Text(
                              "Marah",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LelahPageAdmin(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 75,
                      height: 105,
                      child: Card(
                        shadowColor: const Color.fromARGB(255, 43, 43, 43),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text("😩", style: TextStyle(fontSize: 40)),
                            Text(
                              "Lelah",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BosanPageAdmin(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 75,
                      height: 105,
                      child: Card(
                        shadowColor: const Color.fromARGB(255, 43, 43, 43),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text("😕", style: TextStyle(fontSize: 40)),
                            Text(
                              "Bosan",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Column(
              children: [
                //===== Junk Food =====/
                Stack(
                  children: [
                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kategori_makanan/JunkFood.jpeg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 260),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JunkFoodPageAdmin(),
                            ),
                          );
                        },
                        child: Text(
                          "See Details",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100, left: 15),
                          child: Text(
                            "Junk Food",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15),

                //===== Healty Food =====//
                Stack(
                  children: [
                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kategori_makanan/HealtyFood.jpeg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 260),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HealtyFoodPageAdmin(),
                                ),
                              );
                            },
                            child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45, left: 15),
                          child: Text(
                            "Healty Food",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15),

                //===== Whole Food =====//
                Stack(
                  children: [
                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kategori_makanan/WholeFood.jpeg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 260),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WholeFoodPageAdmin(),
                                ),
                              );
                            },
                            child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45, left: 15),
                          child: Text(
                            "Whole Food",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15),

                //===== Processes Food =====//
                Stack(
                  children: [
                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kategori_makanan/ProcessedFood.jpeg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 260),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProcessedFoodPageAdmin(),
                                ),
                              );
                            },
                            child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45, left: 15),
                          child: Text(
                            "Processed Food",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15),

                //===== Diet Food =====//
                Stack(
                  children: [
                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kategori_makanan/DietFood.jpeg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 260),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DietFoodPageAdmin(),
                                ),
                              );
                            },
                            child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45, left: 15),
                          child: Text(
                            "Diet Food",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15),

                //===== Comfort Food =====//
                Stack(
                  children: [
                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kategori_makanan/ComfortFood.jpeg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 260),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ComfortFoodPageAdmin(),
                                ),
                              );
                            },
                            child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45, left: 15),
                          child: Text(
                            "Comfort Food",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15),

                //===== Organic Food =====//
                Stack(
                  children: [
                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kategori_makanan/OrganicFood.jpeg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 260),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrganicFoodPageAdmin(),
                                ),
                              );
                            },
                            child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45, left: 15),
                          child: Text(
                            "Organic Food",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15),

                //===== Pastry Food =====//
                Stack(
                  children: [
                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kategori_makanan/PastryFood.jpeg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 260),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PastryFoodPageAdmin(),
                                ),
                              );
                            },
                            child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45, left: 15),
                          child: Text(
                            "Pastry Food",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15),

                //===== Sweets Food =====//
                Stack(
                  children: [
                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kategori_makanan/SweetsFood.jpeg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Container(
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 260),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SweetsFoodPageAdmin(),
                                ),
                              );
                            },
                            child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45, left: 15),
                          child: Text(
                            "Sweets Food",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15),
              ],
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
