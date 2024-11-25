import 'package:flutter/material.dart';
import 'package:myapp/core/color_constant.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
