import 'package:flutter/material.dart';
import 'homescreen.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> films;
  final Function(int) toggleFavorite;

  FavoriteScreen({required this.films, required this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
    // Filter hanya film favorit
    final favoriteFilms = films.where((film) => film["favorit"] == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Film Favorit"),
        backgroundColor: const Color.fromARGB(255, 20, 47, 93),
        centerTitle: true,
      ),
      body: favoriteFilms.isEmpty
          ? const Center(
              child: Text(
                "Belum ada film favorit",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriteFilms.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final film = favoriteFilms[index];
                // Dapatkan index asli di list films
                final realIndex = films.indexOf(film);

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        film["gambar"] ?? "assets/images/default.jpg",
                        width: 50,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: GestureDetector(
                      child: Text(
                        film["judul"],
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // Navigasi ke FilmDetailScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilmDetailScreen(film: film),
                          ),
                        );
                      },
                    ),
                    subtitle: Text("Rilis: ${film["tahun"]}"),
                    trailing: IconButton(
                      icon: Icon(
                        film["favorit"] ? Icons.favorite : Icons.favorite_border,
                        color: film["favorit"] ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        // Toggle favorit di HomeScreen
                        toggleFavorite(realIndex);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}