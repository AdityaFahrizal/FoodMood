import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/senang/mkn_sng.dart';

class ResepSandwich extends StatelessWidget {
  const ResepSandwich({super.key});

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
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.white),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MakananSenang()),
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
                          "assets/images/makanan/s.jpg",
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
                              "Sandwich",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Sandwich adalah roti isi daging, sayur, dan keju yang simpel.",
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
                  "1. 2 lembar roti tawar\n"
                  "2. 1 lembar keju slice\n"
                  "3. 1 lembar daging asap / ham / telur dadar\n"
                  "4. Daun selada secukupnya\n"
                  "5. 2 iris tomat segar\n"
                  "6. Saus yang sesuai dengan selera\n",
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
                    child: Image.asset("assets/images/sandwich/s1.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "1. Panggang roti sebentar hingga sedikit garing.",
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
                    child: Image.asset("assets/images/sandwich/s2.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "2. Oleskan saus pada salah satu sisi roti..",
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
                    child: Image.asset("assets/images/sandwich/s3.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "3. Susun isian, letakkan daun selada, tomat, daging/ham/telur, lalu keju.",
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
                    child: Image.asset("assets/images/sandwich/s4.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "4. Tutup dengan lembar roti kedua.",
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
                    child: Image.asset("assets/images/sandwich/s5.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "5. Potong jadi dua bagian agar lebih mudah dimakan.",
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
                    child: Image.asset("assets/images/sandwich/s6.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(child: Text("6. Sajikan")),
                  
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
                                "- Jantung\n",
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