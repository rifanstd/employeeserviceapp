class ApiUrl {
  static const baseUrl = "https://api.themoviedb.org/3/";
  static const apiV = "api/v1/";
  static const signUp = "${apiV}auth/signup";
  static const signIn = "${apiV}auth/signin";
  static const trendingMovies = "trending/movie/day?language=en-US";
  static const trendingTV = "trending/tv/day?language=en-US";
  static const popularTV = "tv/popular?language=en-US&page=1";

  // Bearer Token
  // This is not best practice, but for demo purpose
  // Maybe we can use .env file to put the token
  static const bearerToken =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWMzOTdiYTQwMDU3OWVkNzQxODJiMTkwNmI4MjJlNCIsIm5iZiI6MTczMDIwOTIwMS4zNjE5MTYsInN1YiI6IjY3MjBlNGNjNGJlMTU0NjllNzBlNzFiZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._jLx_ZgmbPTLuQjCiWqeuW71tRyrWFw0YoUUclo_W9E";
}
