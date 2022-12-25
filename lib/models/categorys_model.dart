// ignore_for_file: prefer_collection_literals

class CategorysModel {
  int? id;
  String? name;

  CategorysModel({this.id, this.name});

  CategorysModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
