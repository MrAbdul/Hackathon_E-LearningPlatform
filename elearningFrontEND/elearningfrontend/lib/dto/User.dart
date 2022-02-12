class User {
  String? accessToken;
  String? userId;
  int? type;
  String? username;

  User({this.accessToken, this.userId, this.type, this.username});

  User.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    userId = json['userId'];
    type = json['type'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['userId'] = this.userId;
    data['type'] = this.type;
    data['username'] = this.username;
    return data;
  }
}