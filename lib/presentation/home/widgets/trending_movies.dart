import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:employeeserviceapp/presentation/home/bloc/trending_cubit.dart';
import 'package:employeeserviceapp/presentation/home/bloc/trending_state.dart';
import 'package:employeeserviceapp/presentation/home/widgets/trending_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return const Center(child: CupertinoActivityIndicator(radius: 16, color: AppColors.info500));
          }

          if (state is TrendingMoviesLoaded) {
            return TrendingSection(movies: state.movies);
          }

          if (state is TrendingMoviesFailedLoad) {
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
