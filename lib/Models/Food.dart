import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'category.dart';

class Food {
  int id;
  String name;
  String urlImage;
  Duration duration; // Time to finish food
  Complexity complexity; //ability
  List<String> ingredients = List<String>();
  int categoryId;
  Food(
      {@required this.name,
      @required this.urlImage,
      @required this.duration,
      this.complexity,
      this.ingredients,
      this.categoryId}) {
    this.id = Random().nextInt(1000);
  }
}

enum Complexity { Simple, Medium, Hard }
