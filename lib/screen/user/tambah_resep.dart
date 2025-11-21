import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';


class TambahResepUserPage extends StatefulWidget {
  const TambahResepUserPage({super.key});

  @override
  State<TambahResepUserPage> createState() => _TambahResepAdminPageState();
}

class _TambahResepAdminPageState extends State<TambahResepUserPage> {
  final TextEditingController menuNameController = TextEditingController();
  final TextEditingController menuDescriptionController = TextEditingController();
  final TextEditingController menuTimeController = TextEditingController();
  final TextEditingController menuResepController = TextEditingController();
  final TextEditingController menuInstructionController = TextEditingController();

  String? _imageBase64;
  bool isLoading = false;

Future<void> pickImage() async {
  try {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
    );

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final compressedBytes = await FlutterImageCompress.compressWithFile(
        file.absolute.path,
        quality: 60,
        format: CompressFormat.jpeg,
      );

      if (compressedBytes != null) {
        setState(() {
          _imageBase64 = base64Encode(compressedBytes);
        });
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal mengompres gambar')),
        );
      }
    }
  } catch (e) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gagal memuat gambar: $e')),
    );
  }
}


  Future<void> simpanData() async {
    if (menuNameController.text.isEmpty ||
        menuDescriptionController.text.isEmpty ||
        menuTimeController.text.isEmpty ||
        menuResepController.text.isEmpty ||
        menuInstructionController.text.isEmpty ||
        _imageBase64 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua kolom harus diisi!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      await FirebaseFirestore.instance
          .collection('menuResep')
          .doc('Senang')
          .collection('menuResep')
          .add({
        'nama': menuNameController.text,
        'deskripsi': menuDescriptionController.text,
        'waktu': menuTimeController.text,
        'bahan': menuResepController.text,
        'cara': menuInstructionController.text,
        'gambar': _imageBase64,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Resep berhasil disimpan!')),
      );

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Menu (Senang)"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: menuNameController,
              decoration: const InputDecoration(
                labelText: 'Nama Menu',
                prefixIcon: Icon(Icons.fastfood),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: menuDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi Menu',
                prefixIcon: Icon(Icons.description),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: pickImage,
              child: _imageBase64 == null
                  ? Container(
                      height: 150,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Icon(Icons.add_a_photo, size: 50),
                    )
                  : Image.memory(
                      base64Decode(_imageBase64!),
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: menuTimeController,
              decoration: const InputDecoration(
                labelText: 'Waktu Membuat',
                prefixIcon: Icon(Icons.timer),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: menuResepController,
              decoration: const InputDecoration(
                labelText: 'Bahan-bahan',
                prefixIcon: Icon(Icons.list),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: menuInstructionController,
              decoration: const InputDecoration(
                labelText: 'Cara Membuat',
                prefixIcon: Icon(Icons.menu_book),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : simpanData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Simpan Resep",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
