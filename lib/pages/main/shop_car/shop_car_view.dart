import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shop_car_logic.dart';

class ShopCarPage extends StatelessWidget {
  final ShopCarLogic logic = Get.put(ShopCarLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Image.asset('assets/images/carCar.png'),
              SizedBox(width: 5,),
              Text('选择配送地址',style: TextStyle(color: Colors.black,fontSize: 15),),
              SizedBox(width: 5,),
              Image.asset('assets/images/carArrow.png')
            ],
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        width: Get.mediaQuery.size.width,
        child: SingleChildScrollView(
          child: Image.asset('assets/images/shopcarPage.png',fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
