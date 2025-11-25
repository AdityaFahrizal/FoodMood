// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:food_mood_2/screen/user/MyMenu/resep_mymenu.dart';

// class MyMenuDetailPage extends StatefulWidget {
//   final Map<String, dynamic> menuData;
//   const MyMenuDetailPage({super.key, required this.menuData});

//   @override
//   State<MyMenuDetailPage> createState() => _MyMenuDetailPageState();
// }

// class _MyMenuDetailPageState extends State<MyMenuDetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     final menuId = widget.menuData['id']?.toString() ?? '';

//     if (menuId.isEmpty) {
//       return const Scaffold(
//         body: Center(child: Text("ID menu tidak ditemukan.")),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFFF714B),
//         title: const Text(
//           "Food Mood",
//           style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//       ),

//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('MyMenu')
//             .doc(menuId)
//             .collection('resep')
//             .orderBy('timestamp', descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(
//               child: Text(
//                 "Belum ada resep.\nTekan tombol + untuk menambahkan.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//             );
//           }

//           final resepList = snapshot.data!.docs;

//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: resepList.length,
//             itemBuilder: (context, index) {
//               final data = resepList[index].data() as Map<String, dynamic>;

//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // --- UI ASLI TIDAK DIUBAH ---
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFF714B),
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                     padding: const EdgeInsets.all(8),
//                     child: Column(
//                       children: [
//                         if (data['gambar'] != null && data['gambar'] != '')
//                           Card(
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             clipBehavior: Clip.antiAlias,
//                             child: Image.memory(
//                               base64Decode(data['gambar']),
//                               width: double.infinity,
//                               height: 200,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         const SizedBox(height: 12),
//                         Text(
//                           data['nama'] ?? 'Tanpa Nama',
//                           style: const TextStyle(
//                             fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         Text(
//                           data['deskripsi'] ?? '',
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             height: 1.4,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   const Text(
//                     "Bahan-bahan:",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     data['bahan'] ?? '-',
//                     style: const TextStyle(fontSize: 15, height: 1.6),
//                   ),
//                   const SizedBox(height: 12),

//                   const Text(
//                     "Langkah-langkah:",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 6),

//                   if (data['langkah'] is List)
//                     Column(
//                       children: List.generate(
//                         (data['langkah'] as List).length,
//                         (stepIndex) {
//                           final step = data['langkah'][stepIndex];

//                           return Padding(
//                             padding: const EdgeInsets.only(bottom: 12),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("${stepIndex + 1}. ${step['text'] ?? '-'}"),
//                                 if (step['image'] != null)
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 6),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(8),
//                                       child: Image.memory(
//                                         base64Decode(step['image']),
//                                         width: double.infinity,
//                                         height: 150,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),

//                   const Divider(thickness: 1.2, height: 30),
//                 ],
//               );
//             },
//           );
//         },
//       ),

//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color(0xFFFF714B),
//         child: const Icon(Icons.add, color: Colors.white),
//         onPressed: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ResepMyMenuPage(
//                 menuData: widget.menuData,
//               ),
//             ),
//           );

//           if (result == true) setState(() {});
//         },
//       ),
//     );
//   }
// }
