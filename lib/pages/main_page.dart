import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/background_ui.dart';
import 'package:flutter_movie_app/pages/foreground_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    TextEditingController movieSearch = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundUi(height: height, width: width),
          ForegroundUi(height: height, width: width, movieSearch: movieSearch),
        ],
      ),
    );
  }
}
