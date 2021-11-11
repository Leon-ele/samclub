import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:samsclub/pages/main/mobile_login/verify_code.dart';

import 'mobile_login_logic.dart';

class MobileLoginPage extends StatelessWidget {
  final MobileLoginLogic logic = Get.put(MobileLoginLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '登录',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          elevation: 0),
      body: _buildBody(children: [
        _buildTitle(),
        SizedBox(
          height: 65,
        ),
        _buildMobileMemberBg(),
        SizedBox(
          height: 26,
        ),
        _buildAgreementWidget(),
        SizedBox(
          height: 47,
        ),
        _buildLoginBtn(),
        SizedBox(
          height: 35.0,
        ),
        _buildWechatLogin(),
        SizedBox(
          height: 54,
        ),
        _buildMemberGuide()
      ]),
    );
  }

  Widget _buildBody({required List<Widget> children}) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: children,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 24, top: 30),
      child: Text(
        '欢迎山姆会员',
        style: TextStyle(
            color: Color(0xFF222427),
            fontSize: 20,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildMobileMemberBg() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      // color: Colors.yellow,
      child: Form(
        key: logic.formKey,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Color(0xFFDCE0E4), width: 0.5))),
              child: Row(
                children: [
                  Text(
                    '+86',
                    style: TextStyle(color: Color(0xFF222427), fontSize: 16),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  _buildVerticalLine(),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                        controller: logic.mobileMemberController,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(11)
                        ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: '请输入手机号',
                            labelStyle: TextStyle(color: Color(0xFF898E92)),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            suffixIcon: Obx(() => Visibility(
                                visible: logic.showClear.value,
                                child: IconButton(
                                    icon: Icon(
                                      CupertinoIcons.clear_thick_circled,
                                      color: Color(0xFFCBD0D4),
                                    ),
                                    onPressed: logic.clearField))))),

                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buileCodeFormField()
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalLine() {
    return Container(
      height: 18,
      width: 0.5,
      color: Color(0xFFC9CED3),
    );
  }

  Widget _buildBottomLine() {
    return Container(
      height: 0.5,
      color: Color(0xFFDCE0E4),
    );
  }

  Widget _buildMobileMemberPre() {
    return Row(
      children: [
        Text(
          '+86',
          style: TextStyle(color: Color(0xFF222427), fontSize: 16),
        ),
        SizedBox(
          width: 5,
        ),
        _buildVerticalLine()
      ],
    );
  }

  Widget _buileCodeFormField() {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFDCE0E4), width: 0.5))),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(6)
              ],
              controller: logic.codeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '验证码',
                labelStyle: TextStyle(color: Color(0xFF898E92)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          VerifyCodeWidget()
        ],
      ),
    );
  }

  Widget _buildAgreementWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          InkWell(
              onTap: () => logic.checkArgement(),
              child: Obx(() => Image.asset(logic.checkBox.value
                  ? 'assets/images/login_note_hightlight.png'
                  : 'assets/images/login_note_normal.png'))),
          SizedBox(
            width: 5,
          ),
          RichText(
              text: TextSpan(
                  text: '我已阅读并同意',
                  style: TextStyle(color: Colors.black,fontSize: 12),
                  children: [
                TextSpan(
                    text: '《山姆会籍使用条款》',
                    style: TextStyle(color: Color(0xFF007AFF))),
                TextSpan(text: '及', style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '《隐私条款》', style: TextStyle(color: Color(0xFF007AFF)))
              ]))
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return InkWell(
      onTap: logic.loginClick,
      child: Obx(()=>Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        height: 48.0,
        alignment: Alignment.center,
        width: Get.mediaQuery.size.width,
        color: logic.loginBtnEable.value ? Color(0xFF007AFF) : Color(0x4D0165B8),
        child: Text(
          '登录',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      )),
    );
  }

  Widget _buildWechatLogin() {
    return Column(
      children: [
        IconButton(
            iconSize: 50,
            icon: Image.asset('assets/images/login_weixin.png'),
            onPressed: () {}),
        Text(
          '微信登录',
          style: TextStyle(color: Color(0xFF898E92), fontSize: 12),
        )
      ],
    );
  }

  Widget _buildMemberGuide() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
                  text: '还不是山姆会员？成为会员，',
                  style: TextStyle(color: Color(0xFF898E91), fontSize: 12),
                  children: [
                    TextSpan(text:'购买会籍￼',style: TextStyle(color: Color(0xFF007AFF)))
                  ]
              )

          ),
          Image.asset('assets/images/login_buy.png')
        ],
      ),

    );
  }
}
