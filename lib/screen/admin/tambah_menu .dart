import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/senang/senang_page.dart';
import 'package:food_mood_2/screen/mood/senang/sng_page.dart';

class TambahMenuSenang extends StatefulWidget {
  @override
  _TambahMenuSenang createState() => _TambahMenuSenang();
}

class _TambahMenuSenang extends State<TambahMenuSenang> {
  final TextEditingController menuNameController = TextEditingController();
  final TextEditingController menuDescriptionController =
      TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  Future<void> saveMenuItem() async {
    final String menuName = menuNameController.text.trim();
    final String menuDescription = menuDescriptionController.text.trim();
    final String imageUrl = imageUrlController.text.trim();
    if (menuName.isEmpty || menuDescription.isEmpty || imageUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua kolom harus diisi!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('menuItems')
          .doc(menuName)
          .set({
            'name': menuName,
            'description': menuDescription,
            'imageUrl': imageUrl,
            'timestamp': FieldValue.serverTimestamp(),
          });
      setState(() {
        menuNameController.clear();
        menuDescriptionController.clear();
        imageUrlController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(' Data menu berhasil disimpan!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(' Gagal menyimpan data menu: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
              MaterialPageRoute(builder: (context) => SenangPageAdmin()),
            );
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: menuNameController,
              decoration: InputDecoration(
                label: const Text("Email"),
                prefixIcon: const Icon(Icons.mail),
                hintText: "Masukan Email Kalian",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: menuDescriptionController,
              decoration: InputDecoration(
                label: const Text("Email"),
                prefixIcon: const Icon(Icons.mail),
                hintText: "Masukan Email Kalian",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(
                label: const Text("Email"),
                prefixIcon: const Icon(Icons.mail),
                hintText: "Masukan Email Kalian",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveMenuItem,
              child: const Text('Simpan Data'),
            ),
          ],
        ),
      ),
    );
  }
}
