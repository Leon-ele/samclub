// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:samsclub/routes/app_pages.dart';
import 'package:samsclub/routes/app_routes.dart';
import 'package:samsclub/storage_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor:Colors.white,
          scaffoldBackgroundColor:Colors.white
      ),
      initialRoute: isLogin()?Routes.MAIN:Routes.MOBILELOGIN,
      getPages: Pages.pages(),
    );
  }
  // 判断是否登录
  static bool isLogin() {
    var accessToken =
    StorageManager.sharedPreferences.get(StorageManager.access_token);
    if (null == accessToken || (accessToken as String).isEmpty) {
      return false;
    }
    return true;
  }
}

