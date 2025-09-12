import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_mood_2/screen/sedih/sdh_page.dart';
import 'package:food_mood_2/screen/senang/sng_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFFFF714B),
          title: Text(
            "Food Mood",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.white),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 15)),
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

              Padding(padding: EdgeInsets.only(top: 15)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Mood Kamu Lagi Kaya Gimana Nih..",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //=================== SENANG ===================//

                    SizedBox(
                      width: 65,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SenangFood(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("😁", style: TextStyle(fontSize: 35)),
                                Text(
                                  "Senang",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //=================== SEDIH ===================//

                    SizedBox(
                      width: 65,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SedihPage()));
                          },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("😭", style: TextStyle(fontSize: 35)),
                                Text(
                                  "Sedih",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //=================== MARAH ===================//

                    SizedBox(
                      width: 65,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("😡", style: TextStyle(fontSize: 35)),
                                Text(
                                  "Marah",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //=================== LELAH ===================//

                    SizedBox(
                      width: 65,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("😕", style: TextStyle(fontSize: 35)),
                                Text(
                                  "Lelah",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //=================== BOSAN ===================//

                    SizedBox(
                      width: 65,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("😩", style: TextStyle(fontSize: 35)),
                                Text(
                                  "Bosan",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 40)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Atau Mau Cari Resep Makanan Nih..",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),

              //=================== Junk Food ====================//

              SizedBox(
                width: 380,
                height: 160,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            "assets/images/kategori_makanan/JunkFood.jpg",
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          "Junk Food",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 270),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
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

              //=================== Healty Food ====================//

              Padding(padding: EdgeInsets.only(top: 15)),
              SizedBox(
                width: 380,
                height: 160,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            "assets/images/kategori_makanan/healtyfood.jpg",
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          "Healty Food",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 270),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
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

              //=================== Whole Food ====================//

              Padding(padding: EdgeInsets.only(top: 15)),
              SizedBox(
                width: 380,
                height: 160,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            "assets/images/kategori_makanan/wholefood.jpg",
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          "Whole Food",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 270),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
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

            //=================== Proses Food ====================//

              Padding(padding: EdgeInsets.only(top: 15)),
              SizedBox(
                width: 380,
                height: 160,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            "assets/images/kategori_makanan/prosesfood.jpg",
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          "Processed Food",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 270),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
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

            //=================== Organic Food ====================//

              Padding(padding: EdgeInsets.only(top: 15)),
              SizedBox(
                width: 380,
                height: 160,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            "assets/images/kategori_makanan/organicfood.jpg",
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          "Organic Food",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 270),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
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

            //=================== Confort Food ====================//

              Padding(padding: EdgeInsets.only(top: 15)),
              SizedBox(
                width: 380,
                height: 160,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            "assets/images/kategori_makanan/Confortfood.jpg",
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          "Comfort Food",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 270),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
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

            //=================== Diet Food ====================//

              Padding(padding: EdgeInsets.only(top: 15)),
              SizedBox(
                width: 380,
                height: 160,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            "assets/images/kategori_makanan/dietfood.jpg",
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          "Diet Food",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 270),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
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

            //=================== Diet Food ====================//

              Padding(padding: EdgeInsets.only(top: 15)),
              SizedBox(
                width: 380,
                height: 160,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            "assets/images/kategori_makanan/pastryfood.jpg",
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          "Pastry Food",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 270),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
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

            //=================== Sweets Food ====================//

              Padding(padding: EdgeInsets.only(top: 15)),
              SizedBox(
                width: 380,
                height: 160,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            "assets/images/kategori_makanan/sweetsfood.jpg",
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          "Sweets Food",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 270),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
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
              Padding(padding: EdgeInsets.only(top: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
