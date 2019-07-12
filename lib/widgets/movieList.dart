import 'package:flutter/material.dart';
import 'package:flutter_movies/widgets/movieTitle.dart';
import 'package:flutter_movies/widgets/movieCell.dart';
import 'package:flutter_movies/services/movieService.dart';

class MovieList extends StatefulWidget {
  final service = new MoviesService();

  @override
  MovieListState createState() => MovieListState(service: service);
}

class MovieListState extends State<MovieList> {
  final Color mainColor = const Color(0xff3C3261);
  Map movies;
  
  final MoviesService service;
  MovieListState({this.service}) {
    // retrieve data
    getData();
  }

  void getData() async {
    var data = await service.getJson();
    print(data);
    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: mainColor),
        title: Text('Movies',
            style: TextStyle(
                color: mainColor,
                fontFamily: 'Arvo',
                fontWeight: FontWeight.bold)),
        actions: <Widget>[Icon(Icons.menu, color: mainColor)],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MovieTitle(mainColor),
              Expanded(
                child: ListView.builder(
                  itemCount: movies != null ? movies.length : 0,
                  itemBuilder: (context, i) {
                    return FlatButton(
                        child: MovieCell(movies: movies, index: i),
                        padding: const EdgeInsets.all(0.0),
                        color: Colors.white,
                        onPressed: () {},);
                  },
                ),
              ),
            ],
          )),
    );
  }
}
