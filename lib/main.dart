import 'package:flutter/material.dart';
import 'package:food/foods_page.dart';
import 'Category_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App with Navigation',
        initialRoute: '/',
        routes: {
          '/FoodPage': (context) => FoodPage(),
          '/CategoryPage': (context) => CategoryPage()
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'IndieFlower',
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Food Categories',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SafeArea(child: CategoryPage()),
        ));
  }
}
