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
    var promise = http.get(url);

    // handle error situations
    promise.catchError((error) {
      // print error to console
      print(error);
    });


    var response = await promise;
    return json.decode(response.body);
  }
}