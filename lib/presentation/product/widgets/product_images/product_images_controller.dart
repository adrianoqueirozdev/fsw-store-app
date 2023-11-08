import 'package:get/get.dart';

class ProductImagesController extends GetxController {
  final List<String> imageUrls;

  ProductImagesController({required this.imageUrls});

  final _currentImage = "".obs;

  String get currentImage => _currentImage.value;

  void changeCurrentImage(String imageUrl) {
    _currentImage.value = imageUrl;
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
