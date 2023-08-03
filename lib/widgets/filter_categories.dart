import 'package:flutter/material.dart';


import '../theme.dart';

class Categories extends StatefulWidget {

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategoryIndex = 0;
  List<String> categoryList = ["Torino","Milano"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(
          8
      ),
      child: Container(
        height: size.height * 0.04,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return _buildCategory(context, index);
          },
        ),
      ),
    );
  }


  Widget _buildCategory(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: selectedCategoryIndex == index
                ? purpleColor
                : purpleColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),),
          child: Center(
            child: Text(
              categoryList[index],style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedCategoryIndex == index ? Colors.white : Colors.black
            ),
            ),
          ),
        ),
      ),
    );
  }


}