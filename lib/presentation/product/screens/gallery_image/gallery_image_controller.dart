import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryImageController extends GetxController {
  final int initialPage;

  GalleryImageController(this.initialPage);

  late final PageController pageController;

  final _currentPage = 0.obs;

  int get currentPage => _currentPage.value;

  void onPageChanged(int index) {
    pageController.jumpToPage(index);
    _currentPage.value = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: initialPage);
    _currentPage.value = initialPage;

    super.onInit();
  }
}
