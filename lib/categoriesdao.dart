import 'package:cinefy/categories.dart';
import 'package:cinefy/database_helper.dart';

class Categoriesdao{
  Future<List<Categories>> allCategories() async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM categories");
    return List.generate(maps.length, (i) {
      var line = maps[i];
      return Categories(line["category_id"], line["category_name"]);
    });
  }


}