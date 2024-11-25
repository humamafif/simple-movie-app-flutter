import 'package:flutter/material.dart';
import 'package:myapp/core/color_constant.dart';
import 'package:myapp/model/data.dart';
import 'package:myapp/model/movie_model.dart';
import 'package:myapp/pages/search/search_result.dart';
import 'package:myapp/pages/search/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Movie> movieFilter = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    movieFilter = dataMovie;
  }

  void _searchMovie(String query) {
    final filteredList = dataMovie.where((movie) {
      final title = movie.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return title.contains(searchLower);
    }).toList();

    setState(() {
      movieFilter = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            "Search Movie",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            SearchWidget(
              searchController: searchController,
              onSearchChanged: _searchMovie,
            ),
            const SizedBox(height: 10),
            SearchResult(
              movieFilter: movieFilter,
            ),
          ],
        ),
      ),
    );
  }
}
