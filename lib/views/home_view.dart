import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joflex/models/movie.dart';
import 'package:joflex/views/view_more.dart';
import '../api_services/api_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_indicator.dart';
import '../widgets/custom_text_style.dart';
import '../widgets/top_rated_movies.dart';
import '../widgets/trending_movie.dart';
import '../widgets/upcoming_movies.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBat(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending Movies',
                  style: customTextStyle(),
                ),
                const ViewMoreTextButtom(moviesSection: 'now_playing', appBarTitle: 'Trending Movies')
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            FutureBuilder<List<MovieModel>>(
              future: Api().getMovies(moviesSection: 'now_playing'),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  List<MovieModel> data = snapshot.data;
                  return TrendingMovies(model: data);
                } else {
                  return const CustomCircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Rated Movies',
                  style: customTextStyle(),
                ),
                 const ViewMoreTextButtom(appBarTitle: 'Top Rated Movies', moviesSection: 'top_rated',)
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            FutureBuilder<List<MovieModel>>(
              future: Api().getMovies(moviesSection: 'top_rated'),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  List<MovieModel> data = snapshot.data;
                  return TopRatedMovies(model: data);
                } else {
                  return const CustomCircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Movies',
                  style: customTextStyle(),
                ),
                 const ViewMoreTextButtom(appBarTitle: 'Upcoming Movies', moviesSection: 'upcoming',),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            FutureBuilder<List<MovieModel>>(
              future: Api().getMovies(moviesSection: 'upcoming'),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  List<MovieModel> data = snapshot.data;
                  return UpcomingMovies(
                    model: data,
                  );
                } else {
                  return const CustomCircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}

class ViewMoreTextButtom extends StatelessWidget {
  const ViewMoreTextButtom({
    super.key, required this.moviesSection, required this.appBarTitle,
  });
final String moviesSection;
final String appBarTitle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
       onPressed: () {
         Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) => MoreMovies(
                       moviesSection: moviesSection,
                       appBarTitle: appBarTitle,
                     )));
       },
       child: Text(
         'view more',
         style: GoogleFonts.permanentMarker(
             color: Colors.grey,
             decoration: TextDecoration.underline),
       ));
  }
}
