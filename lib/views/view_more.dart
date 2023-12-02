import 'package:flutter/material.dart';
import 'package:joflex/api_services/api_service.dart';
import 'package:joflex/models/movie.dart';
import 'package:joflex/widgets/custom_indicator.dart';
import 'package:joflex/widgets/custom_text_style.dart';
import 'package:joflex/widgets/movie_item.dart';
import '../widgets/page_indicator_icon.dart';
import '../widgets/show_snackbar.dart';

class MoreMovies extends StatefulWidget {
  const MoreMovies({
    super.key,
    required this.moviesSection,
    required this.appBarTitle,
  });
  final String moviesSection;
  final String appBarTitle;

  @override
  State<MoreMovies> createState() => _MoreMoviesState();
}

class _MoreMoviesState extends State<MoreMovies> {
  Future<List<MovieModel>>? future;
  late int pageNumber;
  @override
  void initState() {
    pageNumber = 1;
    future =
        Api().getMovies(moviesSection: widget.moviesSection, page: pageNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child:const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          widget.appBarTitle,
          style: customTextStyle(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<List<MovieModel>>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<MovieModel> data = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                    const SizedBox(
                      height: 20,
                    ),
                    changingPage(context),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const CustomCircularProgressIndicator();
          }
        },
      ),
    );
  }

  Padding changingPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              pageNumber--;
              if (pageNumber == 0) {
                pageNumber = 1;
                showSnackBar(context,
                    color: Colors.amber, text: 'This is the first page');
              }
              future = Api().getMovies(
                  moviesSection: widget.moviesSection, page: pageNumber);

              setState(() {});
            },
            child: const PageIndicatorIcon(
              icon: Icons.arrow_back_ios,
            ),
          ),
          GestureDetector(
              onTap: () {
                pageNumber++;
                future = Api().getMovies(
                    moviesSection: widget.moviesSection, page: pageNumber);

                setState(() {});
              },
              child: const PageIndicatorIcon(
                icon: Icons.arrow_forward_ios,
              )),
        ],
      ),
    );
  }
}
