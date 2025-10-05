import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/user/mood/senang/mnm_sng.dart';
import 'package:food_mood_2/screen/user/mood/senang/sng_page.dart';

class ResepFreakshake extends StatelessWidget {
  const ResepFreakshake({super.key});

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
                MaterialPageRoute(builder: (context) => MinumanSenang()),
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
                          "assets/images/minuman/fs.jpg",
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
                              "Freakshake",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Freakshake adalah minuman dengan topping berlimpah dan mewah.",
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
                                    "15 Menit",
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
                  "1. 200 ml susu dingin\n"
                  "2. 2 scoop es krim (vanila/cokelat sesuai selera)\n"
                  "3. 2 sdm cokelat bubuk atau sirup cokelat\n"
                  "4. Es batu secukupnya\n"
                  "5. Whipped cream\n"
                  "6. Topping sesuai selera seperti Coklat batangan, biskuit, wafer, marshmallow, choco chips dll",
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
                    child: Image.asset("assets/images/freakshake/fs1.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "1. Masukkan susu, es krim, sirup cokelat, dan es batu ke dalam blender. Proses sampai halus dan creamy.",
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
                    child: Image.asset("assets/images/freakshake/fs2.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "2. Oleskan pinggiran gelas dengan cokelat leleh atau selai, lalu tempelkan topping seperti choco chips atau sprinkle agar menarik.",
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
                    child: Image.asset("assets/images/freakshake/fs3.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "3. Tuang milkshake ke dalam gelas besar.",
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
                    child: Image.asset("assets/images/freakshake/fs4.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "4. Semprotkan whipped cream di atas milkshake hingga menggunung.",
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
                    child: Image.asset("assets/images/freakshake/fs5.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "5. Tambahkan biskuit, wafer, marshmallow, cokelat, atau bahkan donat mini di atas whipped cream.",
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
                    child: Image.asset("assets/images/freakshake/fs6.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(child: Text("6. Sajikan, Freak shake siap dinikmati dengan tampilan mewah dan rasa super manis.")),
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
                                "- Diabetes\n"
                                "- kolestrol\n"
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