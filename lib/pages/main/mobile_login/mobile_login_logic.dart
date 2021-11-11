import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:samsclub/pages/main/login_page/user_model.dart';
import 'package:samsclub/routes/app_routes.dart';
import 'package:samsclub/storage_manager.dart';

class MobileLoginLogic extends GetxController {
  RxBool showClear = false.obs;
  RxBool codeEnable = false.obs;
  RxBool checkBox = false.obs;
  RxBool loginBtnEable = false.obs;
  /// 倒计时的计时器。
 late Timer _timer;
  /// 当前倒计时的秒数。
  late int _seconds = 20;
  late bool needRestTime;
  RxString verifyStr = '获取验证码'.obs;

  TextEditingController mobileMemberController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  late String identifierForVendor;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    mobileMemberController.addListener(() {
      showClear.value = mobileMemberController.text.isNotEmpty;
      codeEnable.value = chinaPhoneNumber(mobileMemberController.text);
      setLoginBtnStatus();
    });
    codeController.addListener(() {
      setLoginBtnStatus();
    });
    initPlatformState();

  }
  Future<void> initPlatformState() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      if (Platform.isIOS) {
        IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
       identifierForVendor = iosDeviceInfo.identifierForVendor;
      }
  }
  setLoginBtnStatus(){
    if (mobileMemberController.text.length>=3) {
      loginBtnEable.value = true;
    }else{
      loginBtnEable.value = false;
    }
  }
  clearField() {
    showClear.value = false;
    mobileMemberController.clear();
  }

  checkArgement(){
    checkBox.value = !checkBox.value;
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer.cancel();
  }

  /// 启动倒计时的计时器。
  void startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        _seconds = 20;
        verifyStr.value = '重新发送';
        codeEnable.value = true;
        return;
      }
      _seconds--;
      verifyStr.value = '已发送$_seconds' + 's';
      codeEnable.value = false;
    });
  }
  chageCodeStatus(){
    if (codeEnable.value) {
      startTimer();
    }
  }
  bool chinaPhoneNumber(String input) {
    String regexPhoneNumber =
        "^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$";
    return RegExp(regexPhoneNumber).hasMatch(input);
  }

  loginClick() async{
    if (!loginBtnEable.value) return;
    print(identifierForVendor);
    Fluttertoast.showToast(msg: '登录中',gravity: ToastGravity.CENTER,toastLength:Toast.LENGTH_LONG);
    try{
      var response = await Dio().post('http://www.youyisiyuan.cn/v2/AppController/sysMemberInfo',data: {
        'token':mobileMemberController.text,
        'imei':identifierForVendor
      });
      Map<String,dynamic> data = response.data;
      if (data["code"] == 200) {
        StorageManager.sharedPreferences.setString(StorageManager.access_token, mobileMemberController.text);
        UserModel userModel = UserModel.fromJson(data["data"]);
        StorageManager.localStorage.setItem(StorageManager.access_user, userModel);
        Get.offNamed(Routes.MAIN);
        
      }else{
        Fluttertoast.showToast(msg: '登录失败');
      }
    }catch(e){
      Fluttertoast.showToast(msg: '登录失败');
    }
  }
}
