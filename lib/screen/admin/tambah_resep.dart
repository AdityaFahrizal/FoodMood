import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class TambahResepPage extends StatefulWidget {
  final String moodName;
  final String? docId;
  final Map<String, dynamic>? menuData;

  const TambahResepPage({
    super.key,
    required this.moodName,
    this.docId,
    this.menuData,
  });

  @override
  State<TambahResepPage> createState() => _TambahResepPageState();
}

class _TambahResepPageState extends State<TambahResepPage> {
  final TextEditingController menuNameController = TextEditingController();
  final TextEditingController menuDescriptionController = TextEditingController();
  final TextEditingController menuTimeController = TextEditingController();
  final TextEditingController menuResepController = TextEditingController();
  final TextEditingController menuWarningController = TextEditingController();

  String? _imageBase64;
  bool isLoading = false;
  bool isLoadingData = false;
  List<Map<String, dynamic>> steps = [];

  @override
  void initState() {
    super.initState();
    if (widget.docId != null) {
      _loadData();
    } else if (widget.menuData != null) {
      final md = widget.menuData!;
      menuNameController.text = md['name'] ?? md['nama'] ?? '';
      menuDescriptionController.text = md['description'] ?? md['deskripsi'] ?? '';
      _imageBase64 = md['imageBase64'] ?? md['gambar'];
    }
  }

  Future<void> _loadData() async {
    if (widget.menuData == null || widget.menuData!['id'] == null) return;

    setState(() => isLoadingData = true);
    try {
      final menuId = widget.menuData!['id'];
      final doc = await FirebaseFirestore.instance
          .collection('menuMood')
          .doc(menuId)
          .collection('resep')
          .doc(widget.docId)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        menuNameController.text = data['nama'] ?? '';
        menuDescriptionController.text = data['deskripsi'] ?? '';
        menuTimeController.text = data['waktu'] ?? '';
        menuResepController.text = data['bahan'] ?? '';
        menuWarningController.text = data['warning'] ?? '';
        _imageBase64 = data['gambar'];
        steps = List<Map<String, dynamic>>.from(
          (data['langkah'] ?? []).map((s) => {'text': s['text'] ?? '', 'image': s['image'] ?? ''}),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal memuat data: $e')));
    } finally {
      setState(() => isLoadingData = false);
    }
  }

  Future<Uint8List> compressImage(Uint8List list) async {
    final compressedBytes = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 800,
      minWidth: 800,
      quality: 40,
      format: CompressFormat.jpeg,
    );
    return Uint8List.fromList(compressedBytes);
  }

  Future<void> pickMainImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final compressed = await compressImage(bytes);
      setState(() => _imageBase64 = base64Encode(compressed));
    }
  }

  Future<void> pickStepImage(int index) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final compressed = await compressImage(bytes);
      setState(() => steps[index]['image'] = base64Encode(compressed));
    }
  }

  void addStep() => setState(() => steps.add({'text': '', 'image': ''}));
  void removeStep(int i) => setState(() => steps.removeAt(i));

  Future<void> simpanData() async {
    if (widget.menuData == null || widget.menuData!['id'] == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data menu tidak ditemukan!')),
      );
      return;
    }

    if (_imageBase64 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap tambahkan gambar utama resep!'), backgroundColor: Color(0xFFFF714B)),
      );
      return;
    }
    if (steps.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tambahkan minimal 1 langkah pembuatan!'), backgroundColor: Color(0xFFFF714B)),
      );
      return;
    }

    final validSteps = steps.map((step) {
      final t = (step['text'] ?? '').toString().trim();
      final i = (step['image'] ?? '').toString().trim();
      return {'text': t.isEmpty ? '-' : t, 'image': i.isEmpty ? '' : i};
    }).toList();

    setState(() => isLoading = true);

    try {
      final data = {
        'nama': menuNameController.text.trim().isEmpty ? 'Tanpa Nama' : menuNameController.text.trim(),
        'deskripsi': menuDescriptionController.text.trim().isEmpty ? 'Tidak ada deskripsi' : menuDescriptionController.text.trim(),
        'waktu': menuTimeController.text.trim().isEmpty ? '-' : menuTimeController.text.trim(),
        'bahan': menuResepController.text.trim().isEmpty ? '-' : menuResepController.text.trim(),
        'warning': menuWarningController.text.trim().isEmpty ? '-' : menuWarningController.text.trim(),
        'gambar': _imageBase64 ?? '',
        'langkah': validSteps,
        'timestamp': FieldValue.serverTimestamp(),
      };

      final menuId = widget.menuData!['id'];
      final resepColl = FirebaseFirestore.instance
          .collection('menuMood')
          .doc(menuId)
          .collection('resep');

      if (widget.docId == null) {
        await resepColl.add(data);
      } else {
        await resepColl.doc(widget.docId).update(data);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Resep berhasil disimpan!'), backgroundColor: Color(0xFF4CAF50)),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingData) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F5),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text('Tambah Resep (${widget.moodName})', style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFFF714B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickMainImage,
              child: _imageBase64 == null
                  ? Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                            SizedBox(height: 8),
                            Text('Tambah Gambar', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.memory(base64Decode(_imageBase64!), height: 180, width: double.infinity, fit: BoxFit.cover),
                    ),
            ),
            const SizedBox(height: 20),
            buildInputCard(Icons.fastfood, 'Nama Menu', menuNameController),
            buildInputCard(Icons.description, 'Deskripsi Menu', menuDescriptionController, maxLines: 2),
            buildInputCard(Icons.timer, 'Waktu Membuat', menuTimeController),
            buildInputCard(Icons.list_alt, 'Bahan-bahan', menuResepController, maxLines: 3),

            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Langkah-langkah:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),

            Column(
              children: List.generate(steps.length, (index) {
                final step = steps[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        TextField(
                          controller: TextEditingController(text: step['text']),
                          decoration: InputDecoration(labelText: 'Langkah ${index + 1}', border: const OutlineInputBorder()),
                          onChanged: (val) => step['text'] = val,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () => pickStepImage(index),
                          child: (step['image'] ?? '').isEmpty
                              ? Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
                                  child: const Center(child: Text('+ Tambah Gambar')),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.memory(base64Decode(step['image']), height: 100, width: double.infinity, fit: BoxFit.cover),
                                ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: () => removeStep(index),
                            icon: const Icon(Icons.delete, color: Colors.redAccent),
                            label: const Text('Hapus', style: TextStyle(color: Colors.redAccent)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            TextButton.icon(
              onPressed: addStep,
              icon: const Icon(Icons.add_circle, color: Color(0xFFFF714B)),
              label: const Text('Tambah Langkah', style: TextStyle(color: Color(0xFFFF714B))),
            ),
            buildInputCard(Icons.warning, 'Tidak disarankan bagi yang memiliki penyakit', menuWarningController, maxLines: 3),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : simpanData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF714B),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Simpan Resep', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputCard(IconData icon, String label, TextEditingController controller, {int maxLines = 1}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon, color: const Color(0xFFFF714B)),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
