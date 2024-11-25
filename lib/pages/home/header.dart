import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/data.dart';
import 'package:myapp/pages/home/header_carousel.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return HeaderCarousel(
      reelsData: dataMovie,
      controller: _controller,
      current: _current,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },
    );
  }
}
