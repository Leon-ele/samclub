import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:samsclub/pages/main/category_page/category_view.dart';
import 'package:samsclub/pages/main/home_page/home_view.dart';
import 'package:samsclub/pages/main/mine_page/mine_view.dart';
import 'package:samsclub/pages/main/shop_car/shop_car_view.dart';
import 'package:samsclub/routes/app_routes.dart';
import 'package:samsclub/storage_manager.dart';

import 'kitchen_page/kitchen_view.dart';

class MainLogic extends GetxController {
  // PageView控制器
  late PageController pageController;
  // bottomNavigationBar当前选中的index
  int indexSelected = 0;

  int unreadCount = 0;


  List<Widget> pages = <Widget>[
    HomePage(),
    CategoryPage(),
    KitchenPage(),
    ShopCarPage(),
    MinePage(),
  ];
  // 底部菜单数据
  List<Map> tabs = [
    {
      "title": "首页",
      "image": 'assets/images/tabbar_home.png',
      "selectedImage":'assets/images/tabbar_home_selected.png',
    },
    {
      "title": "分类",
      "image": 'assets/images/tabbar_classify.png',
      "selectedImage":'assets/images/tabbar_classify_selected.png',
    },
    {
      "title": "山姆厨房",
      "image": 'assets/images/tabbar_find.png',
      "selectedImage":'assets/images/tabbar_find_selected.png',
    },
    {
      "title": "购物车",
      "image": 'assets/images/tabbar_shopcar.png',
      "selectedImage":'assets/images/tabbar_shopcar_selected.png',
    },
    {
      "title": "我的",
      "image": 'assets/images/tabbar_my.png',
      "selectedImage":'assets/images/tabbar_my_selected.png',
    },
  ];

  @override
  void onInit() async {
    super.onInit();
    pageController = PageController(initialPage: indexSelected);
    var accessToken = StorageManager.sharedPreferences.get(StorageManager.access_token);
    if (null != accessToken || (accessToken as String).isNotEmpty) {
      Timer.periodic(Duration(seconds: 60), (Timer timer){
        refreshToken();
      });
    }
  }


  List<BottomNavigationBarItem> createBottomItems() {
    return tabs.map((tabBar) {
      String image = tabBar["image"];
      String selectedImage = tabBar["selectedImage"];
      return BottomNavigationBarItem(
        // 未选中
          icon:Image.asset(image,width: 20,height: 20,),
          // 选中
          activeIcon: Image.asset(selectedImage,width: 20,height: 20),
          label: tabBar["title"]);
    }).toList();
  }

  void updateIndexSelected(int index) {
    indexSelected = index;
    pageController.jumpToPage(index);
    update();
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

      }
    }
  }


}
