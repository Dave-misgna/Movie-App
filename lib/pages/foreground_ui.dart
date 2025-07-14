import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/search_category.dart';

class ForegroundUi extends StatelessWidget {
  final double height;
  final double width;
  final TextEditingController movieSearch;
  const ForegroundUi({
    super.key,
    required this.height,
    required this.width,
    required this.movieSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, height * 0.04, 0, 0),
      width: width * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [topBar()],
      ),
    );
  }

  //top bar
  Widget topBar() {
    return Container(
      height: height * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          searchBar(),
          categorySelection(),
          ],
      ),
    );
  }

  Widget searchBar() {
    return SizedBox(
      height: height * 0.05,
      width: width * 0.50,
      child: TextField(
        controller: movieSearch,
        onSubmitted: (value) {},
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.white24),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white54),
          filled: false,
          fillColor: Colors.white24,
        ),
      ),
    );
  }

  Widget categorySelection() {
    return DropdownButton(
      dropdownColor: Colors.black38,
      value: SearchCategory.popular,
      icon: Icon(
        Icons.menu,
        color: Colors.white24,
        ),
      underline: Container(height: 1, color: Colors.white24),
      onChanged: (value) {},
      items: [
        DropdownMenuItem(
          value: SearchCategory.popular,
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
          
        ),

        DropdownMenuItem(
          value: SearchCategory.upcomming,
          child: Text(
            SearchCategory.upcomming,
            style: TextStyle(color: Colors.white),
          ),
        ),

        DropdownMenuItem(
          value: SearchCategory.none,
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
        ),

      ],
    );
  }
}
