
import 'package:flutter/material.dart';

import '../models/movie.dart';

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({
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
        borderRadius: BorderRadius.circular(18)
      ),
      child: Row(children: [
        const Icon(Icons.star,color: Colors.amber,),
        Text(model.voteAverage.roundToDouble().toString()),
      ],),
    );
  }
}