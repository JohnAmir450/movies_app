import 'package:flutter/material.dart';

import '../models/movie.dart';

class CustomReleasedDateWidget extends StatelessWidget {
  const CustomReleasedDateWidget({
    super.key,
    required this.model,
  });

  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(18),
      ),child: Text('Release Date: ${model.releaseDate}',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
    );
  }
}