import 'package:flutter/material.dart';
import 'package:joflex/api_services/api_service.dart';
import 'package:joflex/models/movie.dart';
import 'package:joflex/widgets/custom_text_field.dart';
import 'package:joflex/widgets/movie_item.dart';

class MoreMovies extends StatelessWidget {
  const MoreMovies({
    super.key,
    required this.moviesSection, required this.appBarTitle,
  });
  final String moviesSection;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(appBarTitle,style: customTextStyle(),),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<List<MovieModel>>(
        future: Api().getMovies(moviesSection: moviesSection, page: 2),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<MovieModel> data = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TrendingMovieItem(
                          model: data[index],
                        ),
                      )),
            );
          } else {
            return CustomScrollView();
          }
        },
      ),
    );
  }
}
