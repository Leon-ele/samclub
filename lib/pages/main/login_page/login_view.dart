import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  final LoginLogic logic = Get.put(LoginLogic());

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
        _buildLogo(),
        _buildWeChatLogin(),
        SizedBox(height: 16.0,),
        _buildPhoneLogin(),
        SizedBox(height: 32,),
        _buildBottomText()
      ]),
    );
  }

  Widget _buildBody({required List<Widget> children}) {
    return Container(
      child: Column(
        children: children,
      ),
    );
  }

  _buildLogo(){
    return Container(
      height: 332.0,
      // color: Colors.yellow,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login_oneclick_logo.png'),
            SizedBox(height: 20,),
            Image.asset('assets/images/launch_name.png'),
          ],
        ),
      ),
    );
  }

  _buildWeChatLogin(){
    return InkWell(
      onTap: ()=> logic.gotoMobileLogin(),
      child: Container(
        height: 48,
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        color: Color(0xFF0165B8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login_garyweixin.png'),
            SizedBox(width: 5,),
            Text('微信登录',style: TextStyle(color: Colors.white,fontSize: 16),)
          ],
        ),
      ),
    );
  }

  _buildPhoneLogin(){
    return InkWell(
      onTap: ()=> logic.gotoMobileLogin(),
      child: Container(
        height: 48,
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        color: Color(0xFFEEEEEE),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login_phone.png'),
            SizedBox(width: 5,),
            Text('手机登录',style: TextStyle(color: Color(0xFF000000),fontSize: 16),)
          ],
        ),
      ),
    );
  }

  _buildBottomText(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
              text: '还不是山姆会员？成为会员，',
              style: TextStyle(color: Color(0xFF898E91)),
            children: [
              TextSpan(text: '购买会籍',
                style: TextStyle(
                  color: Color(0xFF007AFF),
                )
              )
            ]
          )),
          Image.asset('assets/images/login_buy.png')
        ],
      ),
    );
  }
}
