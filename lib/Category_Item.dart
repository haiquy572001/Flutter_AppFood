import 'package:flutter/material.dart';

import 'Models/category.dart';
import 'foods_page.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem({this.category});
  @override
  Widget build(BuildContext context) {
    Color _color = this.category.color;
    return InkWell(
      onTap: () => {
        print("Item : ${this.category.content}"),
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => FoodPage(
        //           category: this.category,
        //         )))
        Navigator.pushNamed(context, FoodPage.routeName,
            arguments: {'category': category})
      },
      child: Container(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  this.category.content,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: _color,
                gradient: LinearGradient(
                    colors: [_color.withOpacity(0.6), _color],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
