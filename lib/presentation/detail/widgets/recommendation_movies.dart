import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:employeeserviceapp/presentation/detail/bloc/recommendation_movie_state.dart';
import 'package:employeeserviceapp/presentation/detail/bloc/recommendations_movie_cubit.dart';
import 'package:employeeserviceapp/presentation/home/widgets/trending_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationMovies extends StatelessWidget {
  final int movieId;
  final String type;

  const RecommendationMovies({super.key, required this.movieId, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendationsMovieCubit()..getRecommendationsMovie(movieId, type),
      child: BlocBuilder<RecommendationsMovieCubit, RecommendationsMovieState>(
        builder: (context, state) {
          if (state is RecommendationsMovieLoading) {
            return const Center(child: CupertinoActivityIndicator(radius: 16, color: AppColors.info500));
          }

          if (state is RecommendationsMovieLoaded) {
            return TrendingSection(
              movies: state.movies,
              type: type,
            );
          }

          if (state is RecommendationsMovieFailed) {
            return Text(
              state.error,
              style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
