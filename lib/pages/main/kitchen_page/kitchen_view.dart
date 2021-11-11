import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'kitchen_logic.dart';

class KitchenPage extends StatelessWidget {
  final KitchenLogic logic = Get.put(KitchenLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('山姆厨房',style: TextStyle(color: Colors.black,fontSize: 17),),
      ),
      body: Container(
        width: Get.mediaQuery.size.width,
        child: SingleChildScrollView(
          child: Image.asset('assets/images/kitchenPage.png',fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
