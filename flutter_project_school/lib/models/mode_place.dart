class ModelPlace {
  String? title;
  String? image;
  num? rate;
  bool? favorite;

  ModelPlace({this.title, this.image, this.rate, this.favorite});

  ModelPlace.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    rate = json['rate'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['rate'] = rate;
    data['favorite'] = favorite;
    return data;
  }
}
