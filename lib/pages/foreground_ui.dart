import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/search_category.dart';
import 'package:flutter_movie_app/pages/movies_list.dart';

import '../controller/main_page_controller.dart';
import '../controller/provider.dart';
import '../model/main_page_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class ForegroundUi extends ConsumerWidget {
  final double height;
  final double width;
  final TextEditingController movieSearch;
  late MainPageController mainPageController;
  late MainPageData mainPageData;
  ForegroundUi({
    super.key,
    required this.height,
    required this.width,
    required this.movieSearch,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    mainPageController = ref.watch(mainPageDataControllerProvider.notifier);
    mainPageData = ref.watch(mainPageDataControllerProvider);

    movieSearch.text = mainPageData.searchText;

    return Container(
      padding: EdgeInsets.fromLTRB(0, height * 0.04, 0, 0),
      width: width * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topBar(),
          Container(
            height: height * 0.83,
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child:MoviesList(height: height, width: width) ,
          )
          ],
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
        onSubmitted: (value) => mainPageController.updateSearchmovie(value),
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
      value: mainPageData.searchCategory,
      icon: Icon(
        Icons.menu,
        color: Colors.white24,
        ),
      underline: Container(height: 1, color: Colors.white24),
      onChanged: (value)=> value.toString().isNotEmpty? mainPageController.updateSearchCategory(value.toString()):null,  
      
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
