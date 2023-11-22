import 'package:get/get.dart';

class ProductImagesController extends GetxController {
  final List<String> imageUrls;

  ProductImagesController({required this.imageUrls});

  final _currentImage = "".obs;
  final _initialPage = 0.obs;

  String get currentImage => _currentImage.value;
  int get initialPage => _initialPage.value;

  void changeCurrentImage(String imageUrl) {
    _currentImage.value = imageUrl;

    final index = imageUrls.indexWhere((element) => element == imageUrl);
    _initialPage.value = index;

    update();
  }

  @override
  void onInit() {
    _currentImage.value = imageUrls[0];

    super.onInit();
  }

  @override
  void onClose() {
    _currentImage.close();

    super.onClose();
  }
}
