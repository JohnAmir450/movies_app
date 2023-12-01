import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

CarouselOptions carouselOptions() {
    return CarouselOptions(
      aspectRatio: 15/11,
        pageSnapping: true,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 0.50,
        autoPlayAnimationDuration: const Duration(seconds: 1));
  }