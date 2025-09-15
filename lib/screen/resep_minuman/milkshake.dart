import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/senang/sng_page.dart';
class ResepMilkshake extends StatelessWidget {
  const ResepMilkshake({super.key});

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
                    color: const Color(0xFF8BA3B2),
                  ),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/minuman/ms.jpg",
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
                              "Milkshake",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Milkshake adalah minuman segar berbahan susu dan es krim.",
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
                                    "10 Menit",
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
                  "1. 200 ml susu dingin \n"
                  "2. 2 scoop es krim (rasa sesuai selera, misalnya vanila/cokelat/stroberi) \n"
                  "3. 2 sdm gula atau sirup (opsional) \n"
                  "4. Es batu secukupnya \n"
                  "5. Topping: whipped cream, choco chips, atau buah (opsional)",
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
                    child: Image.asset("assets/images/milkshake/ms1.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "1. Masukkan susu, es krim, gula/sirup, dan es batu ke dalam blender.",
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
                    child: Image.asset("assets/images/milkshake/ms2.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "2. Blender hingga semua bahan halus dan berbusa.",
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
                    child: Image.asset("assets/images/milkshake/ms3.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "3. Tuang ke dalam gelas tinggi.",
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
                    child: Image.asset("assets/images/milkshake/ms4.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "4. Tambahkan topping sesuai selera seperti whipped cream, cokelat parut, atau potongan buah.",
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
                    child: Image.asset("assets/images/milkshake/ms5.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "5. Sajikan segera dalam keadaan dingin.",
                    ),
                  ),
                  
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
                                "- Diabetes \n"
                                "- Penyakit Jantung\n"
                                "- Obesitas\n",
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