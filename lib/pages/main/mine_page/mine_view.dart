import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samsclub/routes/app_routes.dart';

import 'mine_logic.dart';

class MinePage extends StatelessWidget {
  final MineLogic logic = Get.put(MineLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.mediaQuery.size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.mediaQuery.size.width,
                height: 256.0,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/newUserMain_bg_vip.png',
                      fit: BoxFit.fitWidth,
                      width: Get.mediaQuery.size.width,
                    ),
                    Positioned(
                        top: 50,
                        right: 17,
                        child: InkWell(
                          onTap: ()=>logic.logout(),
                          child: Image.asset(
                              'assets/images/newUserMain_message.png'),
                        )),
                    Positioned(
                        top: 75,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          child: Column(
                            children: [
                              _buildMemberName(),
                              SizedBox(
                                height: 26,
                              ),
                              _buildMemberInfoBg()
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                  width: Get.mediaQuery.size.width,
                  child: Image.asset(
                    'assets/images/minePage.png',
                    fit: BoxFit.fill,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemberName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            child:ClipOval(
              child: Image.network(logic.userModel.imagePath??'',fit: BoxFit.cover,),
            ) ,


          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: ()=>Get.toNamed(Routes.MOBILELOGIN),
                  child: Row(
                    children: [
                      Text(
                        logic.userModel.membername??'',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset('assets/images/newUserMain_vip.png')
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      '续费继续尊享卓越会员权益',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMemberInfoBg() {
    return Expanded(
      child: Container(
        width: Get.mediaQuery.size.width,
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/newUserMain_vipBg.png',
              fit: BoxFit.fill,
              width: Get.mediaQuery.size.width,
            ),
            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: Get.mediaQuery.size.width,
                  child: _buildMemberInfo(),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildMemberInfo() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 34, right: 24,top: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: ()=>Get.toNamed(Routes.MEMBER),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      logic.userModel.membername??'',
                      style: TextStyle(
                          color: Color(0xFF232428),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '/${logic.userModel.cardtype??''}',
                      style: TextStyle(
                          color: Color(0xFF232428),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.MEMBER);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/newUserMain_membershipCode.png'),
                    SizedBox(width: 7,),
                    Text(
                      '会员卡',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 34, right: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '优惠券：${logic.userModel.cardtype != '亲友免费卡'?2:0}张',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 3,),
                    Image.asset('assets/images/carArrow.png')

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 48),
                  child: Visibility(
                    visible: logic.userModel.cardtype != '亲友免费卡',
                    child: Row(
                      children: [
                        Text(
                          '积分：${logic.userModel.point??Random().nextInt(30000)}',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 3,),
                        Image.asset('assets/images/carArrow.png')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
