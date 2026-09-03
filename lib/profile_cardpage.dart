import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Widget Flutter", home: const ProfilePage());
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kartu Siswa")),
      body: Center(
        child: Row(
          children: [
            MyProfileCardPage(
              nama: "Beauty",
              kelas: "XI RPL 7",
            ),
            MyProfileCardPage(
              nama: "Chalysta",
              kelas: "XI RPL 7",
            )
          ],
        ),
      ),
    );
  }
}

class MyProfileCardPage extends StatefulWidget {
  final String nama;
  final String kelas;
  const MyProfileCardPage({required this.nama, required this.kelas});

  @override
  State<MyProfileCardPage> createState() => _MyProfileCardPageState();
}

class _MyProfileCardPageState extends State<MyProfileCardPage> {
  bool isFavorite1 = false; //variabel dengan tipe data boolean
  bool isFavorite2 = false; //variabel dengan tipe data boolean

  void toogleFavorite() {
    setState(() {
      isFavorite1 = !isFavorite1; //false=>true true=>false
    });
  }

  void toogleFavorite2() {
    setState(() {
      isFavorite2 = !isFavorite2; //false=>true true=>false
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 300,
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.nama,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(widget.kelas),
                const Text('beauty12@gmail.com'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: toogleFavorite,
                        child: Text(
                          isFavorite1 ? 'Hapus Favorit' : 'Tambah Favorit',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  isFavorite1 ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.red,
                child: Icon(Icons.notifications, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
