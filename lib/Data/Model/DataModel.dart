class DataModel {
  int? uid;
  String? description;
  List<CategoriesData>? categoriesData;

  DataModel({this.uid, this.description, this.categoriesData});

  DataModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    description = json['description'];
    if (json['categoriesData'] != null) {
      categoriesData = <CategoriesData>[];
      json['categoriesData'].forEach((v) {
        categoriesData!.add(new CategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['description'] = this.description;
    if (this.categoriesData != null) {
      data['categoriesData'] =
          this.categoriesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesData {
  int? id;
  int? parentId;
  int? image;
  String? name;
  List<CatList>? catList;
  String? color1;
  String? color2;

  CategoriesData(
      {this.id,
        this.parentId,
        this.image,
        this.name,
        this.catList,
        this.color1,
        this.color2});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parentId'];
    image = json['image'];
    name = json['name'];
    if (json['catList'] != null) {
      catList = <CatList>[];
      json['catList'].forEach((v) {
        catList!.add(new CatList.fromJson(v));
      });
    }
    color1 = json['color1'];
    color2 = json['color2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parentId'] = this.parentId;
    data['image'] = this.image;
    data['name'] = this.name;
    if (this.catList != null) {
      data['catList'] = this.catList!.map((v) => v.toJson()).toList();
    }
    data['color1'] = this.color1;
    data['color2'] = this.color2;
    return data;
  }
}

class CatList {
  int? id;
  int? parentId;
  int? image;
  String? name;
  String? type;

  CatList({this.id, this.parentId, this.image, this.name, this.type});

  CatList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parentId'];
    image = json['image'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parentId'] = this.parentId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}