import 'package:flutter/material.dart';
import 'fake_data.dart';
import 'Category_Item.dart';

class CategoryPage extends StatelessWidget {
  static final String routeName = "/CategoryPage";
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      children: fakeCategory
          .map((eachcategory) => CategoryItem(category: eachcategory))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
    );
  }
}
