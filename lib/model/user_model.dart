class UserModel {
  String userId, email, name, pic;

  UserModel({this.userId, this.email, this.name, this.pic});
  UserModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return;
    }
    userId = json['userId'];
    email = json['email'];
    name = json['name'];
    pic = json['pic'];
  }
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
