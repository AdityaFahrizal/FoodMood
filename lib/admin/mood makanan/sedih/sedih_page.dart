import 'package:flutter/material.dart';
import 'package:food_mood_2/admin/dashboard_admin.dart';

class SedihPageAdmin extends StatefulWidget {
  const SedihPageAdmin({super.key});

  @override
  State<SedihPageAdmin> createState() => _SedihPageAdminState();
}

class _SedihPageAdminState extends State<SedihPageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                MaterialPageRoute(builder: (context) => Home_Admin()),
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
          ],
        ),
          )
        )
      );
  }
}