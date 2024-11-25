import 'package:flutter/material.dart';
import 'package:myapp/core/color_constant.dart';
import 'package:myapp/pages/home/header.dart';
import 'package:myapp/pages/home/news_movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text(
          "MovieApp",
          style: TextStyle(
              color: white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            NewsMovie(),
          ],
        ),
      ),
    );
  }
}
