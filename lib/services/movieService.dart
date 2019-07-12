import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class MoviesService {
  
  Future<Map> getJson() async {
    const url = 'http://api.themoviedb.org/3/discover/movie?api_key=';
    var response = await http.get(url);
    return json.decode(response.body);
  }
}