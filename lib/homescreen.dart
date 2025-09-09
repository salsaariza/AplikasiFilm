import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Map<String, dynamic>> films;
  final Function(int) toggleFavorite;

  HomeScreen({required this.films, required this.toggleFavorite});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cinemation"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 20, 47, 93),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Banner / header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 20, 47, 93),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        "Selamat Datang",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      SizedBox(height: 8),
      Text(
        "Pilih film favoritmu",
        style: TextStyle(color: Colors.white, fontSize: 14),
        textAlign: TextAlign.center, 
      ),
    ],
  ),
)
              ],
            ),
          ),

          SizedBox(height: 16),

          // Daftar Film dalam GridView
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65, // proporsi kartu
              ),
              itemCount: widget.films.length,
              itemBuilder: (context, index) {
                final film = widget.films[index];
                return GestureDetector(
                  onTap: () {
                    // pindah ke detail screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilmDetailScreen(film: film),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16)),
                          child: Image.network(
                            film["gambar"],
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                film["judul"],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Rilis: ${film["tahun"]}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(
                              film["favorit"]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: film["favorit"] ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              widget.toggleFavorite(index);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilmDetailScreen extends StatelessWidget {
  final Map<String, dynamic> film;

  FilmDetailScreen({required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(film["judul"])),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(film["gambar"], height: 300),
            SizedBox(height: 16),
            Text(
              film["judul"],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text("Tahun Rilis: ${film["tahun"]}",
                style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            SizedBox(height: 16),
            Text(
              film["sinopsis"],
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
