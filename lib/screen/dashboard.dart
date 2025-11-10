import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/auth/login.dart';
import 'package:food_mood_2/screen/auth/profile.dart';
import 'package:food_mood_2/screen/menu.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/comfortfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/dietfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/healtyfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/junkfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/organicfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/pastryfood.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/processedfppd.dart';
import 'package:food_mood_2/screen/user/kategori%20makanan/wholefood.dart';
import 'package:food_mood_2/screen/user/mood/bosan/bsn_page.dart';
import 'package:food_mood_2/screen/user/mood/lelah/llh_page.dart';
import 'package:food_mood_2/screen/user/mood/marah/mrh_page.dart';
import 'package:food_mood_2/screen/user/mood/sedih/sdh_page.dart';
import 'package:food_mood_2/screen/user/mood/senang/sng_page.dart';
import 'package:food_mood_2/screen/user/test_resep_chk_pcrn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFF714B),
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
                  MaterialPageRoute(builder: (context) => const HomePage()),
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
            SizedBox(height: 400),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Mood Kamu Lagi Kaya Gimana Nih..",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
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
                        MaterialPageRoute(builder: (context) => SenangPage()),
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
                        MaterialPageRoute(builder: (context) => SedihPage()),
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
                        MaterialPageRoute(builder: (context) => MarahPage()),
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
                        MaterialPageRoute(builder: (context) => LelahPage()),
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
                        MaterialPageRoute(builder: (context) => BosanPage()),
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

            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Atau Mau Cari Resep Makanan Nih..",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20,),

            Column(
              children: [

                //===== Junk Food =====/

                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 380,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/kategori_makanan/JunkFood.jpg',
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
                            child: TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => JunkFoodPage()));
                            }, child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),),
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
                ),


                SizedBox(height: 15,),

                //===== Healty Food =====//

                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 380,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/kategori_makanan/healtyfood.jpg',
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
                            child: TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HealtyFoodPage()));
                            }, child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),),
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
                ),

                SizedBox(height: 15,),

                //===== Whole Food =====//

                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 380,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/kategori_makanan/wholefood.jpg',
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
                            child: TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => WholeFoodPage()));
                            }, child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),),
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
                ),

                SizedBox(height: 15,),

                //===== Processes Food =====//

                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 380,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/kategori_makanan/prosesfood.jpg',
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
                            child: TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProcessedFoodPage()));
                            }, child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),),
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
                ),

                SizedBox(height: 15,),

                //===== Diet Food =====//


                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 380,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/kategori_makanan/dietfood.jpg',
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
                            child: TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DietFoodPage()));
                            }, child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),),
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
                ),

                SizedBox(height: 15,),

                //===== Comfort Food =====//

                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 380,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/kategori_makanan/Confortfood.jpg',
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
                            child: TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ComfortFoodPage()));
                            }, child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),),
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
                ),

                SizedBox(height: 15,),

                //===== Organic Food =====//

                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 380,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/kategori_makanan/organicfood.jpg',
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
                            child: TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => OrganicFoodPage()));
                            }, child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),),
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
                ),

                SizedBox(height: 15,),

                //===== Pastry Food =====//

                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 380,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/kategori_makanan/dietfood.jpg',
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
                            child: TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PastryFoodPage()));
                            }, child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 45, left: 15),
                            child: Text(
                              "Passtry Food",
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
                ),

                SizedBox(height: 15,),

                //===== Diet Food =====//

                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 380,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/kategori_makanan/sweetsfood.jpg',
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
                            child: TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ResepChickenPopcorn()));
                            }, child: Text(
                              "See Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),),
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
                ),

                SizedBox(height: 15,),
              ],
            ),

            const SizedBox(height: 15),

            
          ],
        ),
      ),
    );
  }
}
