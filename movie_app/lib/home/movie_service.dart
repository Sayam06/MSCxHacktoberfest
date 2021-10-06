import 'package:movie_app/environment_config.dart';

class MovieService {
  MovieService(this._environmentConfig, this._dio)

  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  Future<List<Movie>> getMovies()  async {
    
  }
}