import 'package:cinefy/categories.dart';
import 'package:cinefy/database_helper.dart';
import 'package:cinefy/directors.dart';
import 'package:cinefy/movies.dart';

class Moviesdao{
  Future<List<Movies>> allMoviesByCategoryId(int category_id) async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM movies, categories, directors "
        "WHERE movies.category_id = categories.category_id and movies.director_id = directors.director_id and movies.category_id = $category_id" );
    return List.generate(maps.length, (i) {
      var line = maps[i];

      var c = Categories(line["category_id"], line["category_name"]);
      var d = Directors(line["director_id"], line["director_name"]);
      var m = Movies(line["movie_id"], line["movie_name"], line["movie_year"],line["movie_picture"], c ,d);
      return m;
    });
  }

}