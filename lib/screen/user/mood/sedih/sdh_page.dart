import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/dashboard.dart';
import 'package:food_mood_2/screen/user/resep_makanan/chiken_pop.dart';
import 'package:food_mood_2/screen/user/mood/sedih/mkn_sdh.dart';
import 'package:food_mood_2/screen/user/mood/sedih/mnm_sedih.dart';

class SedihPage extends StatelessWidget {
  const SedihPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF714B),
          title: Center(
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
                  icon: Icon(Icons.menu, color: Colors.white),
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
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),

        drawer: Builder(
          builder: (context) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF714B),
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
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 100)),
                    SizedBox(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shadowColor: Colors.transparent,
                          backgroundColor: const Color(0xFFA6B28B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MakananSedih(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 18,
                              ),
                            ),
                            Icon(Icons.fastfood, color: Colors.white, size: 25),
                            Padding(padding: EdgeInsets.only(left: 10)),
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
                      //============================================================ Minuman ============================================================//
                    ),
                    Padding(padding: EdgeInsets.only(top: 100, left: 12)),
                    SizedBox(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shadowColor: Colors.transparent,
                          backgroundColor: const Color(0xFF8BA3B2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MinumanSedih(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 18,
                              ),
                            ),
                            Icon(
                              Icons.local_cafe,
                              color: Colors.white,
                              size: 25,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
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
              Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                width: 350,
                height: 40,
                child: SearchBar(
                  textInputAction: TextInputAction.search,
                  leading: Icon(Icons.search),
                  hintText: "Cari di sini...",
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 25)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Ini Ada Beberapa Rekomendasi Makanan..",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Semoga Kamu Suka Ya..",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 20)),

              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor:
              //         Colors.transparent,
              //     shadowColor: Colors.transparent,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadiusGeometry.circular(12),
              //     ),
              //     minimumSize: Size(450, 100),
              //   ),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => ResepBurger()),
              //     );
              //   },
              //   child: Container(
              //     width: 450,
              //     height: 100,

              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: const Color(0xFFA6B28B),
              //     ),
              //     child: Row(
              //       children: [
              //         Padding(padding: EdgeInsets.only(left: 10)),
              //         ClipRRect(
              //           borderRadius: BorderRadius.circular(10),
              //           child: Image.asset(
              //             "assets/images/b.jpg",
              //             fit: BoxFit.cover,
              //             width: 85,
              //             height: 85,
              //           ),
              //         ),
              //         Padding(padding: EdgeInsets.only(top: 2, left: 10)),

              //         Container(
              //           width: 250,
              //           height: 120,
              //           child: Column(
              //             children: [
              //               Padding(padding: EdgeInsets.only(top: 10)),
              //               Text(
              //                 "Burger",
              //                 style: TextStyle(
              //                   fontSize: 25,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.only(left: 30),
              //                 child: Text(
              //                   "Daging sapi, keju leleh, saus, sayuran dalam roti burger",
              //                   style: TextStyle(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.black,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResepChickenPopcorn(),
                    ),
                  );
                },
                child: Container(
                  width: 380,
                  height: 100,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFA6B28B),
                  ),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 8)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/makanan/ap.jpg",
                          fit: BoxFit.cover,
                          width: 85,
                          height: 85,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 2, left: 10)),

                      SizedBox(
                        width: 250,
                        height: 120,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              "Chicken PopCorn",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Chicken Popcorn adalah ayam kecil renyah berbumbu gurih.",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 2, left: 10)),
                    ],
                  ),
                ),
              ),

              //========== milkshake ==========/
              // Padding(padding: EdgeInsets.only(top: 10)),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => ResepMilkshake()));
              //   },
              //   child: Container(
              //     width: 380,
              //     height: 100,

              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: const Color(0xFF8BA3B2),
              //     ),
              //     child: Row(
              //       children: [
              //         Padding(padding: EdgeInsets.only(left: 8)),
              //         ClipRRect(
              //           borderRadius: BorderRadius.circular(10),
              //           child: Image.asset(
              //             "assets/images/minuman/ms.jpg",
              //             fit: BoxFit.cover,
              //             width: 85,
              //             height: 85,
              //           ),
              //         ),
              //         Padding(padding: EdgeInsets.only(top: 2, left: 10)),

              //         SizedBox(
              //           width: 250,
              //           height: 120,
              //           child: Column(
              //             children: [
              //               Padding(padding: EdgeInsets.only(top: 10)),
              //               Text(
              //                 "Milkshake",
              //                 style: TextStyle(
              //                   fontSize: 25,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.only(left: 30),
              //                 child: Text(
              //                   "Milkshake adalah minuman segar berbahan susu dan es krim.",
              //                   style: TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.black,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Padding(padding: EdgeInsets.only(top: 2, left: 10)),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
