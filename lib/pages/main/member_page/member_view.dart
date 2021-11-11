import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'member_logic.dart';

class MemberPage extends StatelessWidget {
  final MemberLogic logic = Get.put(MemberLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: Get.size.height + 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/member_great_bg.png'),
                    fit: BoxFit.fill)),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: IconButton(
                            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () {
                              Get.back();
                            }),
                      ),
                      Text(
                        '会员卡',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: Text(
                          '会员章程',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  _buildCard(),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/member_bottomlogo.png'),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Image.asset('assets/images/membercard_great.png'),
          SizedBox(
            height: 18,
          ),
          Container(
            height: 85,
            width: 85,
            child: Image.network(logic.userModel.imagePath??'',fit: BoxFit.fill,),
          ),
          SizedBox(
            height: 11,
          ),
          Text(
            '${logic.userModel.membername}(${logic.userModel.cardtype})',
            style: TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '卡号：${logic.insetKongge(logic.userModel.memberaccount!)}',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 26),
            height: 70,
            child: BarCodeImage(
              params: Code128BarCodeParams(
                logic.userModel.memberaccount,
                lineWidth:1.2,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(()=>Text(
            logic.formattedDate.value,
            style: TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
          )),
          SizedBox(
            height: 14,
          ),
          Container(
            width: 180,
            height: 180,
            child: Obx(()=>QrImage(
              data: logic.qrcodeStr.value,
                version: 3
            )),
          ),
          SizedBox(
            height: 11,
          ),
          Obx(()=>Text(
            '${logic.count.value}s后自动刷新',
            style: TextStyle(
                color: Color(0xFF8A8E90),
                fontSize: 11,
                fontWeight: FontWeight.w500),
          )),
          SizedBox(
            height: 26,
          ),
          Container(
            color: Color(0xFFF7F3EE),
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '续费有礼',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  color: Color(0xFFDFDBD6),
                  width: 1,
                  height: 19,
                ),
                Text(
                  '我的优惠券',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
