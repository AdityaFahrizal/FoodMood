import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/user/mood/sedih/sdh_page.dart';

class ResepChickenPopcorn extends StatelessWidget {
  const ResepChickenPopcorn({super.key});

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
                MaterialPageRoute(builder: (context) => SedihPage()),
              );
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 15)),
              Center(
                child: Container(
                  width: 370,
                  height: 350,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFA6B28B),
                  ),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/makanan/ap.jpg",
                          fit: BoxFit.cover,
                          width: 350,
                          height: 200,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),

                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Chicken Popcorn",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Chicken Popcorn adalah ayam kecil renyah berbumbu gurih.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timelapse,
                                    color: const Color.fromARGB(
                                      255,
                                      237,
                                      237,
                                      237,
                                    ),
                                  ),
                                  Text(
                                    "35 Menit",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: const Color.fromARGB(
                                        255,
                                        237,
                                        237,
                                        237,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                "Bahan Bahan :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "1. 300 gram dada ayam fillet → potong kecil-kecil dadu\n"
                  "2. 2 siung bawang putih → haluskan\n"
                  "3. 1 sdt garam\n"
                  "4. 1/2 sdt merica bubuk\n"
                  "5. 1/2 sdt kaldu bubuk (opsional)\n"
                  "6. 1 butir telur (untuk celupan)\n"
                  "7. 5 sdm tepung terigu\n"
                  "8. 3 sdm tepung maizena (atau tepung tapioka)\n"
                  "1 sdt baking powder (opsional, biar lebih renyah)\n"
                  "10. Minyak goreng secukupnya\n",
                ),
              ),

              SizedBox(height: 16),

              Text(
                "Cara Membuat :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),

              Stack(children: [
                
              ],
            ),
              Row(
                children: [
                  SizedBox(
                    width: 85,
                    height: 85,
                    child: Image.asset("assets/images/chicken_popcorn/cp1.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "1. Potong Ayam → Dada ayam fillet dipotong kecil berbentuk dadu.",
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset("assets/images/chicken_popcorn/cp2.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "2. Bumbui → Campur dengan bawang putih, garam, merica, dan kaldu bubuk, lalu diamkan sebentar.",
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset("assets/images/chicken_popcorn/cp3.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "3. Siapkan Tepung → Campur tepung terigu, tepung maizena, dan baking powder.",
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset("assets/images/chicken_popcorn/cp4.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "4. Celupkan → Gulingkan ayam ke telur kocok, lalu balur dengan campuran tepung.",
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset("assets/images/chicken_popcorn/cp5.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "5. Panaskan minyak, goreng ayam hingga kuning keemasan, lalu tiriskan.",
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset("assets/images/chicken_popcorn/cp6.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(child: Text("6. Sajikan chicken popcorn (tambahkan saus jika suka).")),
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 25)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    height: 120,
                    child: Stack(
                      children: [
                        Card(
                          color: const Color.fromARGB(255, 185, 185, 185),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Icon(
                                Icons.warning,
                                color: Colors.amberAccent,
                                size: 50,
                              ),
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Text(
                                "\n"
                                "Tidak Disarankan Bagi Yang Memiliki\n"
                                "- Kolestrol \n"
                                "- Hipertensi \n"
                                "- Diabetes\n",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
                  Padding(padding: EdgeInsets.only(top: 30))
            ],
          ),
        ),
      ),
    );
  }
}