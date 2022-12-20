import 'dart:convert';
import 'package:themoviedb/models/movie.dart';
import 'package:themoviedb/secret/api_keys.dart';
import 'package:http/http.dart';

class MovieController {
  final String baseUrl = "https://api.themoviedb.org/3/";
  final String apiKey = tmdbApiKey;
  final String apiToken = tmdbToken;

  Future<List<Movie>> getUpcomingMovies() async {
    if (apiKey.isEmpty) {
      throw AssertionError('The API key is not available.');
    }

    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/upcoming',
      queryParameters: {
        'api_key': apiKey,
        'include_adult': 'false',
        'language': 'pt-BR',
      },
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];
      return results.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw "Unable to retrieve the upcoming movies.";
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    if (apiKey.isEmpty) {
      throw AssertionError('The API key is not available.');
    }

    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/top_rated',
      queryParameters: {
        'api_key': apiKey,
        'include_adult': 'false',
        'language': 'pt-BR',
      },
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];
      return results.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw "Unable to retrieve the upcoming movies.";
    }
  }

  Future<List<Movie>> getNowPlaying() async {
    if (apiKey.isEmpty) {
      throw AssertionError('The API key is not available.');
    }

    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/now_playing',
      queryParameters: {
        'api_key': apiKey,
        'include_adult': 'false',
        'language': 'pt-BR',
      },
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];
      return results.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw "Unable to retrieve the upcoming movies.";
    }
  }

  Future<List<Movie>> getMovieSearch(movie) async {
    if (apiKey.isEmpty) {
      throw AssertionError('The API key is not available.');
    }

    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/search/movie/',
      queryParameters: {
        'api_key': apiKey,
        'query': movie,
        'include_adult': 'false',
        'language': 'pt-BR',
      },
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];
      return results.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw "Unable to retrieve the upcoming movies.";
    }
  }
}
