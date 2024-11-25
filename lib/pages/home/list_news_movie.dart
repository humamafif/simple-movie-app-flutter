import 'package:flutter/material.dart';
import 'package:myapp/core/color_constant.dart';
import 'package:myapp/model/movie_model.dart';

import 'package:myapp/pages/details/detail_page.dart';

class ListNewsMovie extends StatefulWidget {
  final List<Movie> reelsData;
  const ListNewsMovie({super.key, required this.reelsData});

  @override
  State<ListNewsMovie> createState() => _ListNewsMovieState();
}

class _ListNewsMovieState extends State<ListNewsMovie> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.reelsData.length,
      itemBuilder: (context, index) {
        final data = widget.reelsData[index];
        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                          image: data.urlImage,
                          title: data.title,
                          description: data.description),
                    ));
              },
              child: Container(
                height: 200,
                width: 180,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage(data.urlImage),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              data.title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: white),
            ),
            const Text(
              "100 views",
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(150, 255, 255, 255)),
            ),
          ],
        );
      },
    );
  }
}
