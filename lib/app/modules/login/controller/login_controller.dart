import "package:biblioteca_flutter/app/modules/login/data/model/user_model.dart";
import "package:biblioteca_flutter/app/modules/login/data/repository/user_repository.dart";
import "package:biblioteca_flutter/app/modules/login/service/sign_in_service.dart";
import "package:biblioteca_flutter/app/routes/app_routes.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/src/extension_navigation.dart";
import "package:get/get_rx/src/rx_types/rx_types.dart";
import "package:get/get_state_manager/src/simple/get_controllers.dart";

class LoginController extends GetxController {
  final UserRepository _repository = UserRepository();
  final SignInService _signInService = SignInService();
  RxBool isLoading = false.obs;

  Future<void> trySignInWithGoogle() async {
    isLoading(true);
    try {
      User? user = await _signInService.signInWithGoogle();
      if (user != null) {
        await _saveUser(user);
        _goToHomePage();
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> _saveUser(User user) async {
    User? isSaved = await _repository.getUser(user.id);
    if (isSaved == null) {
      await _repository.addUser(user);
    }
  }

  _goToHomePage() {
    Get.offAllNamed(Routes.HOME);
  }
}