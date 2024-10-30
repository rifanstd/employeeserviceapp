import 'package:cached_network_image/cached_network_image.dart';
import 'package:employeeserviceapp/common/helper/image/tmdb_image_helper.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:employeeserviceapp/domain/movie/entities/movie_entity.dart';
import 'package:employeeserviceapp/presentation/detail/widgets/recommendation_movies.dart';
import 'package:employeeserviceapp/presentation/home/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieEntity movie;
  final String type;

  const MovieDetailPage({super.key, required this.movie, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Movie')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: CachedNetworkImage(imageUrl: TMDbImageHelper.getFullImageUrl(movie.backdropPath)),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.fromLTRB(16.h, 0, 16.h, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? 'Unknown Title',
                    style: AppTextStyle.heading5Bold.copyWith(color: AppColors.textDark, fontSize: 18.sp),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_month_rounded, color: AppColors.textDark, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        movie.releaseDate ?? 'Unknown Release Date',
                        style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark),
                      ),
                      const Spacer(),
                      Icon(Icons.star, color: Colors.amber, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        movie.voteAverage?.toStringAsFixed(1) ?? '0.0',
                        style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Overview',
                    style: AppTextStyle.heading5Bold.copyWith(color: AppColors.textDark),
                  ),
                  SizedBox(height: 8.h),
                  Text(movie.overview ?? 'Unknown Overview', style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark)),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            const SectionTitle(title: 'Recommendations'),
            RecommendationMovies(
              movieId: movie.id ?? 0,
              type: type,
            ),
          ],
        ),
      ),
    );
  }
}
