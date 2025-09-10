import 'package:flutter/material.dart';
import 'film_detail.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Map<String, dynamic>> films;
  final Function(int) toggleFavorite;

  const HomeScreen({
    super.key,
    required this.films,
    required this.toggleFavorite,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar utama
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 47, 93),
        centerTitle: true,
        elevation: 4,
        title: const Text(
          "Cinemation",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    films: widget.films,
                    toggleFavorite: widget.toggleFavorite,
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // Body
      body: Column(
        children: [
          // Header/banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 20, 47, 93),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: const [
                SizedBox(height: 8),
                Text(
                  "Selamat Datang",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Pilih film favoritmu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Grid film
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemCount: widget.films.length,
              itemBuilder: (context, index) {
                final film = widget.films[index];
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman detail film
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
                      boxShadow: const [
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
                        // Gambar film
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.asset(
                            film["gambar"],
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Info film
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                film["judul"],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Rilis : ${film["tahun"]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),

                              // Tombol favorit dengan notifikasi
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: Icon(
                                    film["favorit"]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: film["favorit"]
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    bool wasFavorite =
                                        film["favorit"]; // simpan status sebelum toggle
                                    widget.toggleFavorite(film["id"]);
                                    setState(() {}); // refresh ikon

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          wasFavorite
                                              ? '${film["judul"]} dihapus dari favorit'
                                              : '${film["judul"]} ditambahkan ke favorit',
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
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
