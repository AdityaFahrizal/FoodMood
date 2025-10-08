import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditMenuJunkFood extends StatefulWidget {
  final String docId;
  final Map<String, dynamic> data;

  const EditMenuJunkFood({super.key, required this.docId, required this.data});

  @override
  State<EditMenuJunkFood> createState() => _EditMenuJunkFoodState();
}

class _EditMenuJunkFoodState extends State<EditMenuJunkFood> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late String _kategori;
  String? _imageBase64;
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.data['name']);
    _descController = TextEditingController(text: widget.data['description']);
    _kategori = widget.data['kategori'] ?? 'Makanan';
    _imageBase64 = widget.data['imageBase64'];
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _imageBase64 = base64Encode(bytes);
      });
    }
  }

  Future<void> _updateMenu() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance
          .collection('menuJunkFood')
          .doc(widget.docId)
          .update({
        'name': _nameController.text,
        'description': _descController.text,
        'kategori': _kategori,
        'imageBase64': _imageBase64,
        'timestamp': FieldValue.serverTimestamp(),
      });

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Menu berhasil diperbarui!')),
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
            Navigator.pop(context); 
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: _imageBytes != null
                          ? Image.memory(_imageBytes!,
                              width: 150, height: 150, fit: BoxFit.cover)
                          : (_imageBase64 != null
                              ? Image.memory(
                                  base64Decode(_imageBase64!),
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  width: 150,
                                  height: 150,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.camera_alt,
                                      color: Colors.white, size: 40),
                                )),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nama Menu'),
                  validator: (value) =>
                      value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _descController,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _kategori,
                  items: const [
                    DropdownMenuItem(
                        value: "Makanan", child: Text("Makanan")),
                    DropdownMenuItem(
                        value: "Minuman", child: Text("Minuman")),
                  ],
                  onChanged: (value) => setState(() => _kategori = value!),
                  decoration: const InputDecoration(labelText: 'Kategori'),
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF714B),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    onPressed: _updateMenu,
                    child: const Text(
                      "Simpan Perubahan",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
