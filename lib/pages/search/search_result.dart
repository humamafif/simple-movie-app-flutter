import 'package:flutter/material.dart';
import 'package:myapp/core/color_constant.dart';
import 'package:myapp/model/movie_model.dart';
import 'package:myapp/pages/details/detail_page.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.movieFilter});
  final List<Movie> movieFilter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: movieFilter.isEmpty
          ? const Center(
              child: Text(
              'No Result..',
              style: TextStyle(color: white),
            ))
          : ListView.builder(
              itemCount: movieFilter.length,
              itemBuilder: (context, index) {
                final movie = movieFilter[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                              image: movie.urlImage,
                              title: movie.title,
                              description: movie.description),
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 110,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(movie.urlImage))),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: const TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Row(
                              children:
                                  List.generate(movie.category.length, (index) {
                                final category = movie.category[index];
                                return Text(
                                  "$category${index == movie.category.length - 1 ? '' : ', '}", // Menambahkan koma hanya jika bukan kategori terakhir
                                  style: const TextStyle(
                                      color: Color.fromARGB(150, 255, 255, 255),
                                      fontSize: 12),
                                );
                              }),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  " ${movie.rating}",
                                  style: const TextStyle(
                                    color: white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
