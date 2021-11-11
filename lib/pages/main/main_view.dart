import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_logic.dart';

class MainPage extends StatelessWidget {
  final MainLogic logic = Get.put(MainLogic());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainLogic>(builder: (_) {
      return Scaffold(
          body: PageView(
            controller: logic.pageController,
            children: logic.pages,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              logic.updateIndexSelected(index);
            },
          ),
          bottomNavigationBar: CupertinoTabBar(
            currentIndex: logic.indexSelected,
            // type: BottomNavigationBarType.fixed,
            // selectedFontSize: 12,
            // unselectedFontSize: 12,
            // iconSize: 20,
            // elevation: 4.0,
            onTap: (int index) {
              logic.updateIndexSelected(index);
            },
            items: logic.createBottomItems(),
          ));
    });
  }
}
