import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joflex/models/movie.dart';
import '../constats.dart';
import '../widgets/custom_back_icon.dart';
import '../widgets/custom_ratinf_widget.dart';
import '../widgets/custom_released_date.dart';

class DeatailsScreen extends StatelessWidget {
  const DeatailsScreen({super.key, required this.model});
  final MovieModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          leading: const CustomBackButtom(),
          backgroundColor: Colours.scaffoldColor,
          expandedHeight: MediaQuery.of(context).size.height / 1.5,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colours.scaffoldColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(18)),
                child: Text(
                  model.title,
                  style: GoogleFonts.belleza(color: Colors.white),
                )),
            background: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  '$imageBasic${model.posterPath}',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsetsDirectional.all(12.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(18)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Overview',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      model.overview,
                      style: GoogleFonts.roboto(
                          fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      model.overview,
                      style: GoogleFonts.roboto(
                          fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomReleasedDateWidget(model: model),
                        CustomRatingWidget(model: model)
                      ],
                    ),
                  ]),
            ),
          ),
        )
      ],
    ));
  }
}
