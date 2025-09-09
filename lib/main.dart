import 'package:flutter/material.dart';
import 'package:test1/homescreen.dart'; 
import 'homescreen.dart';
import 'favorite_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Favorit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', // pakai font Poppins untuk seluruh aplikasi
      ),
      home: MainScreen(), // Panggil MainScreen sebagai halaman utama
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Data film statis
  final List<Map<String, dynamic>> films = [
    {
      "judul": "Dua Garis Biru",
      "tahun": "2021",
      "genre": "Asmara",
      "gambar": "assets/images/dua_garis_biru.jpg",
      "sinopsis":
          "Bima dan Dara adalah sepasang kekasih yang masih duduk di bangku SMA. Pada usia 17 tahun, mereka nekat bersanggama di luar nikah. Dara pun hamil. Keduanya kemudian dihadapkan pada kehidupan yang tak terbayangkan bagi anak seusia mereka, kehidupan sebagai orangtua.",
      "favorit": false,
    },
    {
      "judul": "1 Kakak & Ponakan",
      "tahun": "2025",
      "genre": "Keluarga",
      "gambar": "assets/images/1k_7p.jpg",
      "sinopsis":
          "Setelah kakak-kakaknya meninggal dunia mendadak, Hendarmoko, arsitek muda, tiba-tiba menjadi orangtua tunggal bagi para keponakannya. Ketika kesempatan yang lebih baik muncul, ia harus memilih antara cinta, karier, atau keponakan-keponakannya.",
      "favorit": false,
    },
    {
      "judul": "Perayaan Mati rasa",
      "tahun": "2025",
      "genre": "Keluarga",
      "gambar": "assets/images/p_r_m.jpg",
      "sinopsis":
          "Ian (Iqbaal Ramadhan), anak sulung yang merasa tertekan oleh ekspektasi orang tua dan perbandingan dengan adiknya yang sukses, Uta (Umay Shahab).",
      "favorit": false,
    },
    {
      "judul": "Sayap - Sayap Patah",
      "tahun": "2022",
      "genre": "Aksi",
      "gambar": "assets/images/s_s_p.jpeg",
      "sinopsis":
          "Kisah cinta dua orang pasangan, Aji yang berprofesi sebagai anggota Densus 88 dan Nani istrinya.",
      "favorit": false,
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      films[index]["favorit"] = !films[index]["favorit"];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(films: films, toggleFavorite: toggleFavorite),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Film",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorit",
          ),
        ],
      ),
    );
  }
}
