class ApiConsts {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZGVhMDJlODBhYjMzM2Y2YWU5YWQxODBlZjk1NjczOCIsInN1YiI6IjY1MDA2Y2U2ZDdkY2QyMDBmZmViOWQ4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Rz0fkZWZUl6hr64l3Ed7xHGu6B5ZOac-5fv8w6gbnho";
  static const imageBaseUrl = "https://image.tmdb.org/t/p/w500/";
  static String trendingMovieListEndPoint({
    required int page,
  }) {
    return "/discsover/movie?include_adult=false&sort_by=popularity.desc&page=$page";
  }

  static getMovieDetailEndPoint({
    required int movieId,
  }) {
    return "/movie/$movieId";
  }
}
