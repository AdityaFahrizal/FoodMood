import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/user/mood/sedih/mkn_sdh.dart';

class ResepMac extends StatelessWidget {
  const ResepMac({super.key});

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
                MaterialPageRoute(builder: (context) => MakananSedih()),
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
                          "assets/images/makanan/mac.jpg",
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
                              "Mac And Cheese",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Mac and cheese adalah makaroni dengan saus keju creamy dan gurih.",
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
                  "1. 200 g makaroni\n"
                  "2. 2 sdm mentega\n"
                  "3. 2 sdm tepung terigu\n"
                  "4. 400 ml susu cair\n"
                  "5. 100 g keju cheddar parut\n"
                  "6. 50 g keju mozzarella parut (opsional)\n"
                  "7. Garam & merica secukupnya\n",
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
                    child: Image.asset("assets/images/mc/mac1.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "1. Rebus makaroni hingga matang, tiriskan.",
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
                    child: Image.asset("assets/images/mc/mac2.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "2. Lelehkan mentega, masukkan tepung terigu, aduk rata.",
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
                    child: Image.asset("assets/images/mc/mac3.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "3. Tuang susu perlahan, aduk hingga menjadi saus kental.",
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
                    child: Image.asset("assets/images/mc/mac4.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "4. Masukkan keju parut, aduk sampai meleleh.",
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
                    child: Image.asset("assets/images/mc/mac5.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Text(
                      "5. Bumbui dengan garam dan merica.",
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
                    child: Image.asset("assets/images/mc/mac6.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(child: Text("6. Campur makaroni dengan saus keju, aduk rata.")),
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset("assets/images/mc/mac7.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(child: Text("7. Sajikan")),
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