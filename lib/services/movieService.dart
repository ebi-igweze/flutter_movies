import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_movies/services/secretLoader.dart';


class MoviesService {
  
  Future<Map> getJson() async {
    const secretePath = 'secrets.json';
    final secretLoader = SecretLoader(path: secretePath);
    final secret = await secretLoader.load();
    print(secret);

    
    final url = 'http://api.themoviedb.org/3/discover/movie?api_key=${secret.apiKey}';
    var response = await http.get(url);
    return json.decode(response.body);
  }
}