import 'package:employeeserviceapp/presentation/home/widgets/popular_tv.dart';
import 'package:employeeserviceapp/presentation/home/widgets/section_title.dart';
import 'package:employeeserviceapp/presentation/home/widgets/trending_movies.dart';
import 'package:employeeserviceapp/presentation/home/widgets/trending_tv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Trending Movies'),
            const TrendingMovies(),
            SizedBox(height: 16.h),
            const SectionTitle(title: 'Trending TV'),
            const TrendingTV(),
            SizedBox(height: 16.h),
            const SectionTitle(title: 'Most Popular TV'),
            const PopularTV(),
          ],
        ),
      ),
    );
  }
}
