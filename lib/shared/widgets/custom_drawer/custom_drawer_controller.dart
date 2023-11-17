import 'package:firebase_auth/firebase_auth.dart';
import 'package:fsw_store/data/models/current_user.dart';
import 'package:fsw_store/shared/constants/routes.dart';
import 'package:fsw_store/shared/services/sign_in_google_service.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  final _currentUser = CurrentUser().obs;

  CurrentUser? get currentUser => _currentUser.value;

  void navigateToHome() => Get.toNamed(Routes.home);

  void navigateToCatalog() => Get.toNamed(Routes.catalog);

  void navigateToDeals() => Get.toNamed(Routes.deals);

  void navigateToOrders() => Get.toNamed(Routes.orders);

  void loginWithGoogle() async {
    final user = await SignInGoogleService.signInWithGoogle();

    if (user != null) {
      _currentUser.value = _parseToCurrentUser(user);
      update();
    }
  }

  void logout() async {
    await SignInGoogleService.signOut();
    _currentUser.value = CurrentUser();
    update();
  }

  CurrentUser _parseToCurrentUser(User user) {
    return CurrentUser(id: user.uid, name: user.displayName, image: user.photoURL, email: user.email);
  }

  @override
  void onInit() {
    final user = SignInGoogleService.auth.currentUser;

    if (user != null) _currentUser.value = _parseToCurrentUser(user);

    super.onInit();
  }
}
