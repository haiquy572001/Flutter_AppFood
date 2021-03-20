import 'package:flutter/material.dart';
import 'package:food/fake_data.dart';
import './Models/category.dart';
import './Models/Food.dart';
import 'detailFoodPage.dart';

class FoodPage extends StatelessWidget {
  static const String routeName = '/FoodPage';
  Category category;
  FoodPage({this.category});
  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    this.category = arguments['category'];
    List<Food> foods = FAKE_FOODS
        .where((food) => food.categoryId == this.category.id)
        .toList();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            // leading: IconButton(icon: Icon(Icons.backpack), onPressed: null),
            title: Text(
              "Food from ${this.category.content}",
              style: TextStyle(
                  fontSize: 25, color: Colors.white, fontFamily: 'IndieFlower'),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: foods.length > 0
                ? ListView.builder(
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      Food food = foods[index];
                      return InkWell(
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailFoodPage(food: food)))
                        },
                        child: Stack(children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              clipBehavior: Clip.hardEdge,
                              child: Center(
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/Image/loading.jpg',
                                  image: food.urlImage,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 20,
                            child: Container(
                              padding: EdgeInsets.all((5)),
                              decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.timer,
                                      color: Colors.white, size: 25),
                                  Text(
                                    '${food.duration.inMinutes} minutes',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 20,
                            child: Container(
                              padding: EdgeInsets.all((5)),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '${food.complexity.toString().split('.')[1]}',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: Container(
                              padding: EdgeInsets.all((5)),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '${food.name}',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          )
                        ]),
                      );
                    })
                : Text(
                    'No foods found',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
          )),
    );
  }
}
