import 'package:flutter/material.dart';
import 'package:latihan_dart/materi_Button.dart';
import 'package:latihan_dart/materi_Coupertino.dart';
import 'package:latihan_dart/materi_Image.dart';
import 'package:latihan_dart/materi_Row.dart';
import 'package:latihan_dart/materi_Text.dart';
import 'package:latihan_dart/praktikum_cookpad.dart';

void main() {
  runApp(const MyCookpad());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Bu Amal 1',
      home: const DartDemoPage(),
    );
  }
}

class DartDemoPage extends StatefulWidget {
  const DartDemoPage({super.key});

  @override
  State<DartDemoPage> createState() => _DartDemoPageState();
}

class _DartDemoPageState extends State<DartDemoPage> {
  int angka = 7;
  String? hasilData;
  bool loading = false;
  String? namaLengkap;
  
  String cekGanjilGenap(int nilai) {
    return nilai % 2 == 0 ? "Genap" : "Ganjil";
  }

  Future<void> fetchData() async {
    setState(() {
      loading = true;
    });
    
    // Simulasi delay
    await Future.delayed(const Duration(seconds: 4));
    
    setState(() {
      loading = false;
      hasilData = "Data berhasil dimuat!";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Bu Amal 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Angka $angka adalah ${cekGanjilGenap(angka)}'),
            Text('Nama Lengkap: ${namaLengkap ?? "Belum diisi"}'),
            const SizedBox(height: 20),
            loading ? const CircularProgressIndicator() : Text(hasilData ?? 'Data Belum Dimuat'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchData,
              child: const Text('Load Data'),
            ),
          ],

        )
      )
    );
  }
} 