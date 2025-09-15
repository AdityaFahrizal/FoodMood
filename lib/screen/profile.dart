import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/dashboard.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),

        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Icon(Icons.account_circle, size: 100),
              Padding(padding: EdgeInsets.only(top: 30)),
          
              Text(
                "Username",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
          
              SizedBox(
                width: 350,
                height: 70,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text("Nama"),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Nama :",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
          
              Padding(padding: EdgeInsets.only(top: 15)),
          
              SizedBox(
                
                width: 350,
                height: 70,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.mail_rounded),
                    hintText: "Email :",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
          
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.logout), Text("Logout")]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
