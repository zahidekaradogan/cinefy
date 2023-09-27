import 'package:cinefy/categoriesdao.dart';
import 'package:cinefy/movies_page.dart';
import 'package:flutter/material.dart';

import 'categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Categories>> showAllCategories() async {
    //bu metod içerisinde kategori nesnesi olan bir liste verecek.Yani bir veri kümesi olacak.
    var categoryList = await Categoriesdao().allCategories();
    return categoryList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: FutureBuilder<List<Categories>>(
        future: showAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var categoryList = snapshot.data;
            return ListView.builder(
              itemCount: categoryList!.length,
              itemBuilder: (context, index) {
                var category = categoryList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesPage(category: category),));
                  },
                  child: Card(
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(category.category_name),
                        ],
                      ),
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
