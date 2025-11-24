import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TambahMyMenuPage extends StatefulWidget {
  final String mood;

  const TambahMyMenuPage({super.key, required this.mood});

  @override
  State<TambahMyMenuPage> createState() => _TambahMyMenuPageState();
}

class _TambahMyMenuPageState extends State<TambahMyMenuPage> {
  final TextEditingController menuNameController = TextEditingController();
  final TextEditingController menuDescriptionController = TextEditingController();

  String? _imageBase64;
  String? _kategori;

  bool isLoading = false;

  Future<void> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _imageBase64 = base64Encode(bytes);
        });
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat gambar: $e')),
      );
    }
  }

  void showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
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

    setState(() {
      isLoading = true;
    });

    showLoadingDialog();

    try {
      await FirebaseFirestore.instance.collection('MyMenu').add({
        'name': menuName,
        'description': menuDescription,
        'kategori': _kategori,
        'imageBase64': _imageBase64,
        'mood': widget.mood,
      });

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();

      setState(() {
        menuNameController.clear();
        menuDescriptionController.clear();
        _imageBase64 = null;
        _kategori = null;
        isLoading = false;
      });

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data menu berhasil disimpan!'),
          backgroundColor: Colors.green,
        ),
      );

      // ignore: use_build_context_synchronously
      Navigator.pop(context, true);
    } catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      setState(() {
        isLoading = false;
      });

      // ignore: use_build_context_synchronously
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
        title: Text(
          "Tambah Menu (${widget.mood})",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AbsorbPointer(
          absorbing: isLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: menuNameController,
                  decoration: InputDecoration(
                    labelText: "Nama Menu",
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
                  minLines: 4,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Deskripsi Menu",
                    prefixIcon: const Icon(Icons.description),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  initialValue: _kategori,
                  decoration: InputDecoration(
                    labelText: "Kategori",
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
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imageBase64 == null
                        ? const Center(child: Text("Pilih Gambar Menu"))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              base64Decode(_imageBase64!),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: isLoading ? null : saveMenuItem,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF714B),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Simpan Data Menu',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
