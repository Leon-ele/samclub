import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samsclub/storage_manager.dart';

import 'category_logic.dart';

class CategoryPage extends StatelessWidget {
  final CategoryLogic logic = Get.put(CategoryLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Image.asset('assets/images/order_address.png'),
              SizedBox(width: 5,),
              Text(StorageManager.addressList[Random().nextInt(9)],style: TextStyle(color: Colors.black,fontSize: 15),),
              SizedBox(width: 5,),
              Image.asset('assets/images/downMore.png')
            ],
          ),
        ),
        elevation: 0,
        actions: [
          Image.asset('assets/images/class_search.png')
        ],
      ),
      body: Container(
        width: Get.mediaQuery.size.width,
        child: SingleChildScrollView(
          child: Image.asset('assets/images/categoryPage.png',fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
