
class UserModel {
  /// 副卡
  String? cardtype;

  /// 会员卡id
  String? memberId;

  /// 代理唯一标识id
  String? userId;

  /// 会员名称
  String? membername;

  /// 会员卡账号
  String? memberaccount;

  /// 会员卡所在城市
  String? membercity;

  /// 性别
  String? sex;

  /// 会员卡类型：全国、区域
  String? regional;

  /// 授权码
  String? token;

  /// 超时时间
  String? timeOut;

  /// 积分
  String? point;
  String? state;

  String? imagePath;
  String? qrcode;
  UserModel(
      {this.cardtype,
      this.memberId,
      this.userId,
      this.membername,
      this.memberaccount,
      this.membercity,
      this.sex,
      this.regional,
      this.token,
      this.timeOut,
      this.point,
      this.state,
      this.imagePath,
      this.qrcode});
  factory UserModel.fromJson(Map map) {
    return UserModel(
        cardtype: map['cardtype'],
        memberId: map['memberId'],
        userId: map['userId'],
        membername: map['membername'],
        memberaccount: map['memberaccount'],
        membercity: map['membercity'],
        sex: map['sex'],
        regional: map['regional'],
        token: map['token'],
        timeOut: map['timeOut'],
        point: map['point'],
        state: map['state'],
        imagePath:map['imagePath'],
        qrcode:map['qrcode']
    );

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['cardtype'] = cardtype;
    data['memberId'] = memberId;
    data['userId'] = userId;
    data['membername'] = membername;
    data['memberaccount'] = memberaccount;
    data['membercity'] = membercity;
    data['sex'] = sex;
    data['regional'] = regional;
    data['token'] = token;
    data['timeOut'] = timeOut;
    data['point'] = point;
    data['state'] = state;
    data['imagePath'] = imagePath;
    data['qrcode'] = qrcode;
    return data;
  }
  Map toJSONEncodable() {
    Map<String, dynamic> m =  Map();
    m['cardtype'] = cardtype;
    m['memberId'] = memberId;
    m['userId'] = userId;
    m['membername'] = membername;
    m['memberaccount'] = memberaccount;
    m['membercity'] = membercity;
    m['sex'] = sex;
    m['regional'] = regional;
    m['token'] = token;
    m['timeOut'] = timeOut;
    m['point'] = point;
    m['state'] = state;
    return m;
  }
}
