import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:samsclub/pages/main/category_page/category_view.dart';
import 'package:samsclub/pages/main/home_page/home_view.dart';
import 'package:samsclub/pages/main/kitchen_page/kitchen_view.dart';
import 'package:samsclub/pages/main/login_page/login_view.dart';
import 'package:samsclub/pages/main/main_view.dart';
import 'package:samsclub/pages/main/member_page/member_view.dart';
import 'package:samsclub/pages/main/mine_page/mine_view.dart';
import 'package:samsclub/pages/main/mobile_login/mobile_login_view.dart';
import 'package:samsclub/pages/main/shop_car/shop_car_view.dart';
import 'package:samsclub/routes/app_routes.dart';

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: Routes.MAIN,
        page: () => MainPage(),
      ),
      GetPage(
        name: Routes.MOBILELOGIN,
        page: () => LoginPage(),
          transition:Transition.native
      ),
      GetPage(
        name: Routes.HOMEPAG,
        page: () => HomePage(),
      ),
      GetPage(
        name: Routes.CATEGORY,
        page: () => CategoryPage(),
      ),
      GetPage(
        name: Routes.KITCHEN,
        page: () => KitchenPage(),
      ),
      GetPage(
        name: Routes.SHOPCAR,
        page: () => ShopCarPage(),
      ),
      GetPage(
        name: Routes.MINE,
        page: () => MinePage(),
      ),
      GetPage(
        name: Routes.MEMBER,
        page: () => MemberPage(),
      ),
      GetPage(
        name: Routes.LOGIN,
        page: () => MobileLoginPage(),
      ),

    ];
  }
}