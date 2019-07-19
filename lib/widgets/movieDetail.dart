import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_movies/utils.dart';

class MovieDetail extends StatelessWidget {
  final movie;

  MovieDetail({this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          imageUrl + movie['poster_path'],
          fit: BoxFit.cover,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _getImagePoster(),
                _getMovieTitleAndRating(),
                _getMovieDescription(),
                new Padding(padding: const EdgeInsets.all(10.0)),
                _getActionButtons(),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Container _getImagePoster() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 400.0,
        height: 400.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              image: NetworkImage(imageUrl + movie['poster_path']),
              fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                blurRadius: 20.0,
                offset: Offset(0.0, 10.0))
          ]),
    );
  }

  Container _getMovieTitleAndRating() {
    final average = movie['vote_average'];

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 0.0,
      ),
      child: Row(
        children: <Widget>[
          // movie title
          Expanded(
            child: Text(
              movie['title'],
              style: TextStyle(
                fontSize: 30.0,
                color: fontColor,
                fontFamily: fontFamily,
              ),
            ),
          ),

          // movie average
          Text(
            "$average/10",
            style: TextStyle(
              fontSize: 20.0,
              color: fontColor,
              fontFamily: fontFamily,
            ),
          ),
        ],
      ),
    );
  }

  Text _getMovieDescription() {
    // movie overview
    return Text(
      movie['overview'],
      style: TextStyle(
        color: fontColor,
        fontFamily: fontFamily,
      ),
    );
  }

  Container _getActionButtons() {
    return Container(
      child: Row(
        children: <Widget>[
          // rate button
          Expanded(
            child: Container(
              width: 150.0,
              height: 60.0,
              alignment: Alignment.center,
              child: Text(
                'Rate Movie',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Arvo',
                  fontSize: 20.0,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: buttonColor,
              ),
            ),
          ),

          // share icon
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: buttonColor,
              ),
            ),
          ),

          // bookmark icon
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.bookmark, color: fontColor),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: buttonColor)),
          )
        ],
      ),
    );
  }
}
