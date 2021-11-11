import 'package:localstorage/localstorage.dart';
import 'package:samsclub/pages/main/login_page/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  /// 初始化必备操作 eg:user数据
  static late LocalStorage localStorage;

  static late SharedPreferences sharedPreferences;

  static const access_token = "access_token";
  static const access_user = "access_user";

  static const addressList = [
    '首都宾馆(东交民巷)',
    '静源居(翠微路)',
    '链家(景山店)',
    '天顺祥(宝山店)',
    '和谐社区(天威路)',
    '白各庄(将台路)',
  '宏福苑(将台路)',
    '祥瑞大厦(民族园)',
    '彩虹大厦(上地西路)',
    '悦澜湾(博陵街)',
  ];

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    localStorage = LocalStorage('LocalStorage');
    await localStorage.ready;
  }
}