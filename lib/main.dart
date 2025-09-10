import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'favorite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> films = [
    {
      "id": 1,
      "judul": "Dua Garis Biru",
      "tahun": "2021",
      "genre": "Asmara",
      "gambar": "assets/images/dua_garis_biru.jpg",
      "sinopsis":
          "Bima dan Dara adalah sepasang kekasih yang masih duduk di bangku SMA. "
          "Pada usia 17 tahun, mereka nekat bersanggama di luar nikah. Dara pun hamil. "
          "Keduanya kemudian dihadapkan pada kehidupan yang tak terbayangkan bagi anak seusia mereka, "
          "kehidupan sebagai orangtua.",
      "favorit": false,
    },
    {
      "id": 2,
      "judul": "1 Kakak 7 Ponakan",
      "tahun": "2025",
      "genre": "Keluarga",
      "gambar": "assets/images/1k_7p.jpg",
      "sinopsis":
          "Setelah kakak-kakaknya meninggal dunia mendadak, Hendarmoko, arsitek muda, tiba-tiba menjadi orangtua tunggal bagi para keponakannya. Ketika kesempatan yang lebih baik muncul, ia harus memilih antara cinta, karier, atau keponakan-keponakannya.",
      "favorit": false,
    },
     {
      "id": 3,
      "judul": "Perayaan Mati Rasa",
      "tahun": "2025",
      "genre": "Keluarga",
      "gambar": "assets/images/p_r_m.jpg",
      "sinopsis":
          "perjalanan hidup Ian Antono (Iqbaal Ramadhan), seorang anak sulung yang selalu dibanding-bandingkan dengan adiknya, Uta Antono (Umay Shahab). Uta selalu memiliki kehidupan cemerlang sesuai keinginan kedua orangtuanya.",
      "favorit": false,
    },
    {
      "id": 4,
      "judul": "Sayap Sayap Patah",
      "tahun": "2021",
      "genre": "Aksi",
      "gambar": "assets/images/s_s_p.jpeg",
      "sinopsis":
          "Menggambarkan konflik batin Aji sebagai seorang aparat keamanan yang harus memilih antara tugas negara dan keluarga. Kehidupan Nani yang cemas dan menunggu suaminya kembali menambah ketegangan dalam cerita. Sayap-Sayap Patah menyoroti pengorbanan, cinta, dan perjuangan dalam menghadapi terorisme dan ancaman terhadap negara.",
      "favorit": false,
    },
    {
      "id": 5,
      "judul": "Sekawan Limo",
      "tahun": "2024",
      "genre": "Horor Komedi",
      "gambar": "assets/images/sekawan5.jpeg",
      "sinopsis":
          "Mengisahkan lima pemuda yang mendaki Gunung Madyopuro, di mana mereka mengabaikan peringatan untuk tidak mendaki dalam jumlah ganjil dan jangan menoleh ke belakang. Ketika mereka mulai diganggu oleh makhluk gaib dan tersesat, mereka menyadari salah satu dari mereka adalah hantu yang menyamar dan harus mencari tahu siapa di antara mereka yang bukan manusia. ",
      "favorit": false,
    },
    {
      "id": 6,
      "judul": "Dilan 1990",
      "tahun": "2018",
      "genre": "Asmara",
      "gambar": "assets/images/dilan90.jpg",
      "sinopsis":
          "Milea (Vanesha Prescilla) bertemu dengan Dilan (Iqbaal Ramadhan) di sebuah SMA di Bandung. Itu adalah tahun 1990, saat Milea pindah dari Jakarta ke Bandung.",
      "favorit": false,
    },
    {
      "id": 7,
      "judul": "Jumbo",
      "tahun": "2025",
      "genre": "Petualangan",
      "gambar": "assets/images/jumbo.jpg",
      "sinopsis":
          "Don (Prince Poetiray), anak gemuk yang sering diolok-olok dengan panggilan Jumbo ingin membalas perbuatan anak yang suka merundungnya, tapi sesosok arwah bernama Meri (Quinn Salman) meminta pertolongan Don untuk disatukan kembali dengan makam keluarganya yang dirusak.",
      "favorit": false,
    },
    {
      "id": 8,
      "judul": "Yowis Ben Finale",
      "tahun": "2021",
      "genre": "Drama Komedi",
      "gambar": "assets/images/ywb.jpeg", 
      "sinopsis":
          "Bayu khawatir akan masa depan Yowis Ben karena Nando dan Cak Jon berencana mengejar impian mereka yang lain. Keadaan bertambah buruk ketika Asih menuduhnya selingkuh dengan wanita lain.",
      "favorit": false,
    },
  ];

  void toggleFavorite(int id) {
    setState(() {
      final index = films.indexWhere((film) => film["id"] == id);
      if (index != -1) {
        films[index]["favorit"] = !films[index]["favorit"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(films: films, toggleFavorite: toggleFavorite),
      FavoriteScreen(films: films),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins"),
      home: Scaffold(
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
              label: "Semua Film",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorit",
            ),
          ],
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
