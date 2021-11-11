
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samsclub/storage_manager.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  final HomeLogic logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1746.0,
          width: Get.mediaQuery.size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage('assets/images/homePage.png'),
              // image: NetworkImage('http://118.190.173.223:8089/file/uploadPhoto/1.png'),
              image: CachedNetworkImageProvider(
                  'http://118.190.173.223:8089/file/uploadPhoto/1.png',
              ),
              fit: BoxFit.fill,
            )
          ),
          child: SafeArea(
            child: Column(
              children: [
                // SizedBox(height: 20 + Get.window.padding.top,),
                Container(
                  width: Get.size.width,
                    height: 40,
                    child: Image.asset('assets/images/home_top_logo.png',color: Colors.black,alignment:Alignment.topLeft)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 11,right: 5),
                          child: Image.asset('assets/images/order_address.png'),
                        ),
                        Text(StorageManager.addressList[Random().nextInt(9)],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Image.asset('assets/images/downMore.png'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Image.asset('assets/images/home_top_message.png',color: Colors.black,),
                    )

                  ],
                ),
                SizedBox(height: 8,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 11),
                  color: Colors.white,
                  height: 32,
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(children: [
                      Image.asset('assets/images/home_top_search.png',),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text('更好的生活尽在山姆',style: TextStyle(color: Color(0xFFACB1B6),fontSize: 12),),
                      ),
                    ],),
                    Image.asset('assets/images/home_top_scan.png',),
                  ],),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
