import 'package:cinefy/categories.dart';
import 'package:cinefy/detail_page.dart';
import 'package:cinefy/movies.dart';
import 'package:cinefy/moviesdao.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MoviesPage extends StatefulWidget {
  Categories category;

  MoviesPage({super.key, required this.category});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<Movies>> showAllMovies(int category_id) async {
    //bu metod içerisinde movie nesnesi olan bir liste verecek.Yani bir veri kümesi olacak.
    var movieList = await Moviesdao().allMoviesByCategoryId(category_id);
    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies: ${widget.category.category_name} "),
      ),
      body: FutureBuilder<List<Movies>>(
        future: showAllMovies(widget.category.category_id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movieList = snapshot.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: movieList!.length,
              itemBuilder: (context, index) {
                var movie = movieList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(movie: movie),
                        ));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("images/${movie.movie_picture}"),
                        ),
                        Text(
                          movie.movie_name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
