import 'package:get/get.dart';
import 'package:samsclub/routes/app_routes.dart';

class LoginLogic extends GetxController {
    gotoMobileLogin(){
      Get.toNamed(Routes.LOGIN);
    }
}
