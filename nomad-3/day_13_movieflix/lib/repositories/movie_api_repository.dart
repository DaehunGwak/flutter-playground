import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/movie_meta.dart';

abstract class MovieApiRepository {
  static const String _baseUrl = 'https://tmdb-reverse-proxy-api.vercel.app';
  static const String _popularPath = 'v3/movies/popular';
  static const String _nowPlaying = 'v3/movies/now-playing';
  static const String _comingSoon = 'v3/movies/coming-soon';
  static const String _detail = 'v3/movies/';

  static const String _resultsField = 'results';

  static Future<List<SimpleMovie>> getPopularMovies() async {
    final uri = Uri.parse('$_baseUrl/$_popularPath');
    final response = await http.get(uri);
    _handleErrorStatusCode(response);
    _printDebug(response.body);
    final List<dynamic> results =
        _utf8JsonDecode(response.bodyBytes)[_resultsField];
    return results.map((e) => SimpleMovie.fromJson(e)).toList();
  }

  static Future<List<SimpleMovie>> getNowPlayingMovies() async {
    final uri = Uri.parse('$_baseUrl/$_nowPlaying');
    final response = await http.get(uri);
    _handleErrorStatusCode(response);
    _printDebug(response.body);
    final List<dynamic> results =
        _utf8JsonDecode(response.bodyBytes)[_resultsField];
    return results.map((e) => SimpleMovie.fromJson(e)).toList();
  }

  static Future<List<SimpleMovie>> getComingSoonMovies() async {
    final uri = Uri.parse('$_baseUrl/$_comingSoon');
    final response = await http.get(uri);
    _handleErrorStatusCode(response);
    _printDebug(response.body);
    final List<dynamic> results =
        _utf8JsonDecode(response.bodyBytes)[_resultsField];
    return results.map((e) => SimpleMovie.fromJson(e)).toList();
  }

  static Future<DetailMovie> getDetailMovie(int id) async {
    final uri = Uri.parse('$_baseUrl/$_detail$id');
    final response = await http.get(uri);
    _handleErrorStatusCode(response);
    _printDebug(response.body);
    return DetailMovie.fromJson(_utf8JsonDecode(response.bodyBytes));
  }

  static void _handleErrorStatusCode(http.Response response) {
    if (response.statusCode != 200) {
      throw Exception(
        'API 요청 실패 (url: ${response.request?.url}, status code: ${response.statusCode}',
      );
    }
  }

  static void _printDebug(dynamic something) {
    if (kDebugMode) {
      print(something);
    }
  }

  static dynamic _utf8JsonDecode(Uint8List unit) {
    return jsonDecode(utf8.decode(unit));
  }
}
