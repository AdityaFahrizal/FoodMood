import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/admin/dashboard_admin.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/senang/makanan.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/senang/minuman.dart';
import 'package:food_mood_2/screen/admin/tambah_menu%20.dart';

class SenangPageAdmin extends StatefulWidget {
  const SenangPageAdmin({super.key});

  @override
  State<SenangPageAdmin> createState() => _SenangPageAdminState();
}

class _SenangPageAdminState extends State<SenangPageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF714B),
        title: Text(
          "Food Mood",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.italic,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA6B28B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MakananSenangAdmin(),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fastfood, color: Colors.white, size: 25),
                        SizedBox(width: 10),
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
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8BA3B2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MinumanSenangAdmin(),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_cafe, color: Colors.white, size: 25),
                        SizedBox(width: 10),
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
                style: TextStyle(fontSize: 12, fontWeight: 
                FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF714B),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahMenuSenang()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
