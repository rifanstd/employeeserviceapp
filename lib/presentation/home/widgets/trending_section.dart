import 'package:cached_network_image/cached_network_image.dart';
import 'package:employeeserviceapp/common/helper/image/tmdb_image_helper.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:employeeserviceapp/domain/movie/entities/movie_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingSection extends StatelessWidget {
  final List<MovieEntity> movies;

  const TrendingSection({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 8.w,
          ),
          ...List.generate(
            movies.length,
            (index) => Container(
              width: 170,
              margin: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: const Radius.circular(10).r, topRight: const Radius.circular(10).r),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          TMDbImageHelper.getFullImageUrl(movies.elementAt(index).backdropPath),
                        ),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: TMDbImageHelper.getFullImageUrl(movies.elementAt(index).posterPath),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10).r,
                            topRight: const Radius.circular(10).r,
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(
                        radius: 10,
                        color: AppColors.info500,
                      )),
                      errorWidget: (context, url, error) => const Center(
                        child: Text(
                          'Thumbnail not available',
                          style: TextStyle(color: AppColors.textDark),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    movies.elementAt(index).title ?? '',
                    style: AppTextStyle.heading6Medium.copyWith(color: AppColors.textDark),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Synopsis: ${movies.elementAt(index).overview ?? ''}",
                    style: AppTextStyle.smallRegular.copyWith(color: AppColors.textLightDark, fontWeight: FontWeight.normal),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 4.w),
                      Text(movies.elementAt(index).voteAverage?.toStringAsFixed(1) ?? ''),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
        ],
      ),
    );
  }
}
