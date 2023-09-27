// ignore_for_file: must_be_immutable

import 'package:cinefy/movies.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
 Movies movie;
 DetailPage({super.key, required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.movie_name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("images/${widget.movie.movie_picture}"),
            Text(widget.movie.movie_year.toString(), style: const TextStyle(fontSize: 30),),
            Text(widget.movie.director.director_name.toString(), style: const TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}
