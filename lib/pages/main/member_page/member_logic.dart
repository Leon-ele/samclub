import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:samsclub/pages/main/login_page/user_model.dart';
import 'package:samsclub/routes/app_routes.dart';
import 'package:samsclub/storage_manager.dart';

class MemberLogic extends GetxController {
  late UserModel userModel;
  late Timer _timer;
  RxInt count = 60.obs;
  RxString formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()).obs;
  late RxString qrcodeStr = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var userStorage = StorageManager.localStorage.getItem(StorageManager.access_user);
    if (userStorage != null) {
      userModel = UserModel.fromJson(userStorage);
      qrcodeStr.value = userModel.qrcode??'';
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      formattedDate.value = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      if (count.value == 0){
        count.value = 60;
        refreshToken();
      }

      count.value--;
    });
  }
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void dispose() {
    // TODO: implement dispose
      // 页面销毁时触发定时器销毁
      if (_timer.isActive) {  // 判断定时器是否是激活状态
        _timer.cancel();
      }

    super.dispose();

  }

  void refreshToken() async{

    var response = await Dio().post('http://www.youyisiyuan.cn/v2/AppController/verification',data: {
      'token':StorageManager.sharedPreferences.get(StorageManager.access_token)
    });
    print(response.data);
    Map<String,dynamic> data = response.data;
    if (data["code"] == 200) {
      Map map = data["data"];
      if (map["falg"] != true) {
        if (Get.currentRoute != Routes.LOGIN) {
          StorageManager.sharedPreferences.clear();
          Get.offAllNamed(Routes.LOGIN);
        }
      }else{
       qrcodeStr.value = map["qrcode"];
      }
    }
  }

  String insetKongge(String accout){
    if (accout.length>10) {
      print('leon----$accout');
      List<String> strList= accout.split('');
      print(strList);
      strList.insert(3, ' ');
      print(strList);
      strList.insert(10, ' ');

      var concatenate = StringBuffer();
      strList.forEach((element) {
        concatenate.write(element);
      });
      print(concatenate.toString());

      return concatenate.toString();
    }
    return accout;


  }
}
