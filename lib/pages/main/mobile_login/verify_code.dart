import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mobile_login_logic.dart';

class VerifyCodeWidget extends StatelessWidget {
  final MobileLoginLogic logic = Get.put(MobileLoginLogic());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => logic.chageCodeStatus(),
      child: Obx(() => Container(
           padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: logic.codeEnable.value
                        ? Color(0xFF0165B8)
                        : Colors.white)),
            child: Text(
              logic.verifyStr.value,
              style: TextStyle(color: logic.codeEnable.value?Color(0xFF0165B8):Color(0xFFACB1B6)),
            ),
          )),
    );
  }
}
