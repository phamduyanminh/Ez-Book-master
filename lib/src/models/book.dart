class Book {
  List<Results>? results;

  Book({this.results});

  Book.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? auther;
  String? desc;
  String? review;
  String? score;
  String? view;
  List<String>? type;
  String? imgUrl;
  String? content;
  String? createdAt;
  String? updatedAt;

  Results(
      {this.objectId,
      this.name,
      this.auther,
      this.desc,
      this.review,
      this.score,
      this.view,
      this.type,
      this.imgUrl,
      this.content,
      this.createdAt,
      this.updatedAt});

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    name = json['name'];
    auther = json['auther'];
    desc = json['desc'];
    review = json['review'];
    score = json['score'];
    view = json['view'];
    type = json['type'].cast<String>();
    imgUrl = json['imgUrl'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['name'] = name;
    data['auther'] = auther;
    data['desc'] = desc;
    data['review'] = review;
    data['score'] = score;
    data['view'] = view;
    data['type'] = type;
    data['imgUrl'] = imgUrl;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
