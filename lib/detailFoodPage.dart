import 'package:flutter/material.dart';

import './Models/Food.dart';

class DetailFoodPage extends StatelessWidget {
  Food food;
  DetailFoodPage({this.food});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${food.name}',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/Image/loading.jpg',
              image: food.urlImage,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('Ingredients:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: this.food.ingredients.length,
                itemBuilder: (context, index) {
                  String ingredient = this.food.ingredients[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '#${index + 1}',
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                    ),
                    title: Text(
                      ingredient,
                      style: TextStyle(fontSize: 22),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
