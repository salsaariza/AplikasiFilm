import 'package:flutter/material.dart';
import 'package:test1/homescreen.dart'; 

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
      ),
      home: MainScreen(), // Panggil MainScreen sebagai halaman utama
    );
  }
}

// MainScreen akan mengatur bottom navigation (Film & Favorit)
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Data film statis
  final List<Map<String, dynamic>> films = [
    {
      "judul": "Pengabdi Setan",
      "tahun": "2017",
      "gambar": "c:\Users\salsa\OneDrive\Gambar\pengabdi_setan.jpeg",
      "sinopsis":
          "menceritakan kisah seorang wanita bernama Rini dan keluarganya yang mengalami teror gaib setelah kematian ibu mereka. Ibu Rini meninggal setelah sakit bertahun-tahun, dan setelah kepergiannya, rumah keluarga mereka diteror oleh berbagai kejadian mistis. ",
      "favorit": false,
    },
    {
      "judul": "Interstellar",
      "tahun": "2014",
      "gambar": "https://m.media-amazon.com/images/I/91kFYg4fX3L._AC_SY679_.jpg",
      "sinopsis":
          "Sekelompok penjelajah luar angkasa melakukan perjalanan melalui wormhole untuk mencari planet baru bagi kelangsungan hidup manusia.",
      "favorit": false,
    },
    {
      "judul": "The Dark Knight",
      "tahun": "2008",
      "gambar": "https://m.media-amazon.com/images/I/51G8cQ3wG3L._AC_.jpg",
      "sinopsis":
          "Batman menghadapi Joker, penjahat yang ingin membawa kekacauan ke Gotham City.",
      "favorit": false,
    },
    {
      "judul": "Avengers: Endgame",
      "tahun": "2019",
      "gambar": "https://m.media-amazon.com/images/I/81ExhpBEbHL._AC_SY679_.jpg",
      "sinopsis":
          "Para Avengers bersatu kembali untuk membalikkan kehancuran yang dilakukan Thanos dan menyelamatkan alam semesta.",
      "favorit": false,
    },
    {
      "judul": "Parasite",
      "tahun": "2019",
      "gambar": "https://m.media-amazon.com/images/I/91z6a3Urn+L._AC_SY679_.jpg",
      "sinopsis":
          "Keluarga miskin menyusup ke dalam kehidupan keluarga kaya dengan cara yang cerdik, namun berakhir dalam tragedi.",
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
