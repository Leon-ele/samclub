import 'package:get/get.dart';
import 'package:samsclub/pages/main/login_page/user_model.dart';
import 'package:samsclub/routes/app_routes.dart';
import 'package:samsclub/storage_manager.dart';

class MineLogic extends GetxController {
  late UserModel userModel;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    var userStorage = StorageManager.localStorage.getItem(StorageManager.access_user);
    if (userStorage != null) {
       userModel = UserModel.fromJson(userStorage);
    }
  }
  logout(){
    StorageManager.sharedPreferences.clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}
