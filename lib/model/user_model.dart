class UserModel {
  String? userId, email, name, pic, phoneNumber;

  UserModel({this.userId, this.email, this.name, this.pic,this.phoneNumber});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    phoneNumber = map['phoneNumber'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'phoneNumber': phoneNumber,

    };
  }
}