import 'package:flutter/material.dart';
import 'film_detail.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Map<String, dynamic>> films;
  final Function(int) toggleFavorite;

  const FavoriteScreen({
    super.key,
    required this.films,
    required this.toggleFavorite,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // Filter hanya film favorit
    final favoriteFilms = widget.films.where((f) => f["favorit"] == true).toList();

    // Jika tidak ada film favorit
    if (favoriteFilms.isEmpty) {
      return const Center(
        child: Text(
          "Belum ada film favorit",
          style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.65,
      ),
      itemCount: favoriteFilms.length,
      itemBuilder: (context, index) {
        final film = favoriteFilms[index];
        return GestureDetector(
          onTap: () {
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
                // Poster film
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

                // Info + tombol favorit
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              film["judul"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: "Poppins",
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Rilis : ${film["tahun"]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),

                        // Tombol favorit
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: Icon(
                              film["favorit"]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: film["favorit"] ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              bool wasFavorite = film["favorit"];
                              widget.toggleFavorite(film["id"]);
                              setState(() {});

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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
