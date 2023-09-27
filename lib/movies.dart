// ignore_for_file: non_constant_identifier_names

import 'package:cinefy/categories.dart';
import 'package:cinefy/directors.dart';

class Movies{
  int movie_id;
  String movie_name;
  int movie_year;
  String movie_picture;
  Categories category;
  Directors director;

  Movies(this.movie_id, this.movie_name, this.movie_year, this.movie_picture, this.category, this.director);
}