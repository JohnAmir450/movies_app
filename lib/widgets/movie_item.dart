import 'package:flutter/material.dart';
import 'package:joflex/constats.dart';
import 'package:joflex/models/movie.dart';
import 'package:joflex/views/deatails_screen.dart';

import 'adult_circle_avatar.dart';

class TrendingMovieItem extends StatelessWidget {
  const TrendingMovieItem({
    super.key,
    required this.model,
  });
  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DeatailsScreen(model: model)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 2.2,
              child: Image.network(
                '$imageBasic${model.backDropBath}',
                fit: BoxFit.cover,
              ),
            ),
            if (model.adult) const AdultCircleAvatar()
          ],
        ),
      ),
    );
  }
}
