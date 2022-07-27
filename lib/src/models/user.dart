class User {
  List<Results>? results;
  User({this.results});

  User.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? objectId;
  String? username;
  String? name;
  String? password;
  String? phone;
  String? createdAt;
  String? updatedAt;

  Results({
    this.objectId,
    this.username,
    this.name,
    this.password,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    username = json['username'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['username'] = username;
    data['name'] = name;
    data['password'] = password;
    data['phone'] = phone;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
