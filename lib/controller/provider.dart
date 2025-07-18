import 'package:flutter_movie_app/controller/main_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/main_page_data.dart';

// StateNotifierProvider<NotifierClass, StateType>

final mainPageDataControllerProvider =
    StateNotifierProvider<MainPageController, MainPageData>((ref) {
      return MainPageController();
    });

