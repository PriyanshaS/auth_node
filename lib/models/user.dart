class User {
  String? id;
  String? name;
  String? email;
  String? token;
  String? password;

  User({ required this.id,required this.name,required this.email,required this.token,required this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;
    data['password'] = this.password;
    return data;
  }
}
