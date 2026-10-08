import 'package:carousel_slider/carousel_slider.dart';
import 'package:court_click/core/theme/app_colors.dart';
import 'package:court_click/core/theme/text_styles.dart';
import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/tmdb_image.dart';
import 'package:flutter/material.dart';

class HeroCarousel extends StatelessWidget {
  final List<MovieModel> movies;

  const HeroCarousel({super.key, required this.movies});

  static const double height = 460;

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox(height: height);

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: movies.length,
            itemBuilder: (context, index, realIndex) {
              return SizedBox.expand(
                child: TmdbImage(
                  path: movies[index].backdropPath,
                  size: 'w780',
                ),
              );
            },
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              autoPlay: true,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.background.withOpacity(0.7),
                      Colors.transparent,
                      Colors.transparent,
                      AppColors.background,
                    ],
                    stops: const [0, 0.3, 0.6, 1],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  child: Image.asset('assets/images/logos/image.png'),
                ),
                Text('TV Shows', style: AppTextStyle.homeHeadingStyle),
                Text('Movies', style: AppTextStyle.homeHeadingStyle),
                Text('My List', style: AppTextStyle.homeHeadingStyle),
              ],
            ),
          ),
          Positioned(
            left: 50,
            right: 50,
            bottom: 16,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  SizedBox(height: 28,width: 28,
                    child: Image.asset('assets/images/logos/top_10.png')), Text('#2 in Nigeria Today',style: TextStyle(fontWeight: FontWeight.w500),),
                 ],
               ),
               SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, color: AppColors.textPrimary, size: 26),
                        const SizedBox(height: 2),
                        Text(
                          'My List',
                          style: const TextStyle(color: AppColors.textPrimary, fontSize: 11),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow, size: 40),
                        label: const Text(
                          'Play',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.textPrimary,
                          foregroundColor: AppColors.background,
                          padding: const EdgeInsets.only(
                           left: 10,right: 20,top: 8,bottom: 8

                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.info_outline, color: AppColors.textPrimary, size: 26),
                        const SizedBox(height: 2),
                        Text(
                          'Info',
                          style: const TextStyle(color: AppColors.textPrimary, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
