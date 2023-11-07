import 'package:fsw_store/shared/constants/routes.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  void navigateToHome() {
    Get.toNamed(Routes.home);
  }

  void navigateToCatalog() {
    Get.toNamed(Routes.catalog);
  }
}
