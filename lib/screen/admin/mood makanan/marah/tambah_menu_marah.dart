import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_mood_2/screen/admin/mood%20makanan/marah/marah_page.dart';
import 'package:image_picker/image_picker.dart';

class TambahMenuMarah extends StatefulWidget {
  @override
  _TambahMenuMarah createState() => _TambahMenuMarah();
}

class _TambahMenuMarah extends State<TambahMenuMarah> {
  final TextEditingController menuNameController = TextEditingController();
  final TextEditingController menuDescriptionController =
      TextEditingController();

  File? _imageFile;
  String? _imageBase64;

  String? _kategori;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
    );

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageFile = File(pickedFile.path);
        _imageBase64 = base64Encode(bytes);
      });
    }
  }

  Future<void> saveMenuItem() async {
    final String menuName = menuNameController.text.trim();
    final String menuDescription = menuDescriptionController.text.trim();

    if (menuName.isEmpty ||
        menuDescription.isEmpty ||
        _imageBase64 == null ||
        _kategori == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua kolom harus diisi!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('menuMarah').add({
        'name': menuName,
        'description': menuDescription,
        'kategori': _kategori,
        'imageBase64': _imageBase64,
        'timestamp': FieldValue.serverTimestamp(),
      });

      setState(() {
        menuNameController.clear();
        menuDescriptionController.clear();
        _imageFile = null;
        _imageBase64 = null;
        _kategori = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data menu berhasil disimpan!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menyimpan data menu: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF714B),
        title: const Text(
          "Tambah Menu",
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
              MaterialPageRoute(builder: (context) => MarahPageAdmin()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: menuNameController,
                decoration: InputDecoration(
                  label: const Text("Nama Menu"),
                  prefixIcon: const Icon(Icons.menu_book),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: menuDescriptionController,
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: 5,
                decoration: InputDecoration(
                  label: const Text("Deskripsi Menu"),
                  prefixIcon: const Icon(Icons.description),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                value: _kategori,
                decoration: InputDecoration(
                  label: const Text("Kategori"),
                  prefixIcon: const Icon(Icons.category),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: "Makanan", child: Text("Makanan")),
                  DropdownMenuItem(value: "Minuman", child: Text("Minuman")),
                ],
                onChanged: (value) {
                  setState(() {
                    _kategori = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _imageBase64 == null
                      ? const Center(child: Text("Pilih Gambar Menu"))
                      : Image.memory(
                          base64Decode(_imageBase64!),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveMenuItem,
                child: const Text('Simpan Data Menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
