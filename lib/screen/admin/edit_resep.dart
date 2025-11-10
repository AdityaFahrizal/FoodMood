import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditResepPage extends StatefulWidget {
  final String docId;
  final Map<String, dynamic> data;

  const EditResepPage({super.key, required this.docId, required this.data});

  @override
  State<EditResepPage> createState() => _EditResepPageState();
}

class _EditResepPageState extends State<EditResepPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaController;
  late TextEditingController _deskripsiController;
  Uint8List? _imageBytes;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.data['nama']);
    _deskripsiController = TextEditingController(text: widget.data['deskripsi']);
    if (widget.data['gambar'] != null) {
      _imageBytes = base64Decode(widget.data['gambar']);
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  Future<void> _updateResep() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseFirestore.instance
          .collection('menuMood')
          .doc('Senang')
          .collection('menuResep')
          .doc(widget.docId)
          .update({
        'nama': _namaController.text.trim(),
        'deskripsi': _deskripsiController.text.trim(),
        'gambar': _imageBytes != null ? base64Encode(_imageBytes!) : widget.data['gambar'],
        'timestamp': FieldValue.serverTimestamp(),
      });

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Resep berhasil diperbarui')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal memperbarui resep: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF714B),
        title: const Text(
          "Edit Resep",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: _imageBytes != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.memory(
                                _imageBytes!,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              height: 180,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(Icons.image, size: 70, color: Colors.grey),
                            ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        labelText: "Nama Resep",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.fastfood),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Nama resep tidak boleh kosong' : null,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _deskripsiController,
                      decoration: InputDecoration(
                        labelText: "Deskripsi",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.description),
                      ),
                      maxLines: 4,
                      validator: (value) =>
                          value!.isEmpty ? 'Deskripsi tidak boleh kosong' : null,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF714B),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _updateResep,
                        child: const Text(
                          "Simpan Perubahan",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
