import 'dart:convert';
import "package:http/http.dart" show Client, Response;
import 'package:minggu10_movie/model/popular_movies.dart';

class ApiProvider {
  String apiKey = 'fe4e42f1a6967f22a365d70c172175ca';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<Popularmovies> getPopularMovies() async {
    Uri url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    Response response = await client.get(url);

    if (response.statusCode == 200) {
      return Popularmovies.fromjson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
