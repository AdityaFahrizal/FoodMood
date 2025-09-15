import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/resep_makanan/burger2.dart';
import 'package:food_mood_2/screen/resep_makanan/sandwich.dart';
import 'package:food_mood_2/screen/senang/sng_page.dart';

class MakananSenang extends StatelessWidget {
  const MakananSenang({super.key});

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
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SenangFood()),
              );
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),

        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
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


            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResepBurger2()));
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
                              "assets/images/makanan/b.jpg",
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
                                  "Burger",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    "Daging sapi, keju leleh, saus, sayuran dalam roti burger",
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
                ],
              ),
            ),

            //========== sandwich ==========/
            Padding(padding: EdgeInsets.only(top: 10)),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResepSandwich()));
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
                        "assets/images/makanan/s.jpg",
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
                            "Sandwich",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              "Sandwich adalah roti isi daging, sayur, dan keju yang simpel.",
                              style: TextStyle(
                                fontSize: 14,
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

          ],
        ),
          )
        )
      ),
    );
  }
}