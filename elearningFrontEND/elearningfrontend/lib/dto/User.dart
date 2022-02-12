class User {
  String? accessToken;
  String? userId;
  int? type;

  User({this.accessToken, this.userId, this.type});

  User.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    userId = json['userId'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['userId'] = this.userId;
    data['type'] = this.type;
    return data;
  }
}