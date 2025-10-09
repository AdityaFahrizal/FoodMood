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
    'Junk Food',
    'Healty Food',
    'Whole Food',
    'Processes Food',
    'Organic Food',
    'Comfort Food',
    'Diet Food',
    'Pastry Food',
    'Sweets Food',
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
                "Mood",
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
                        MaterialPageRoute(builder: (context) => SenangPageAdmin()),
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
                        MaterialPageRoute(builder: (context) => SedihPageAdmin()),
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
                        MaterialPageRoute(builder: (context) => MarahPageAdmin()),
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
                        MaterialPageRoute(builder: (context) => LelahPageAdmin()),
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
                        MaterialPageRoute(builder: (context) => BosanPageAdmin()),
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

            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Kategori Makanan",
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Junkfood()));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Healtyfood()));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Wholefood()));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Processedfood()));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Dietfood()));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Comfortfood()));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Organicfood()));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Pastryfood()));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Sweetsfood()));
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