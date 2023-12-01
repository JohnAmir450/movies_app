import 'package:flutter/material.dart';
import 'package:joflex/models/movie.dart';

import 'movie_item.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({
    super.key, required this.model,
  });
final List<MovieModel> model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>  TrendingMovieItem(model: model[index],),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(
            width: 15,
          ),
          itemCount: 10,
        ));
  }
}