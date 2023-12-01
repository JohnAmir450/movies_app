import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:joflex/models/movie.dart';

import 'carousel_options.dart';
import 'movie_item.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    super.key, required this.model,
  });
  final List<MovieModel> model;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 10,
      itemBuilder: (context, index, pageIndex) =>  TrendingMovieItem(model: model[index],),
      options: carouselOptions(),
    );
  }
}
