class TMDbImageHelper {
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String getFullImageUrl(String? path) {
    if (path != null) return baseImageUrl + path;
    return '';
  }
}
