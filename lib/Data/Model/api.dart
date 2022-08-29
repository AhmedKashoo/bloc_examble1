class ApiTest {
  ApiTest({
    required this.total,
    required this.Result,
    required this.cats,
  });
  late final int total;
  late final bool Result;
  late final List<Cats> cats;

  ApiTest.fromJson(Map<String, dynamic> json){
    total = json['total'];
    Result = json['Result'];
    cats = List.from(json['cats']).map((e)=>Cats.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['Result'] = Result;
    _data['cats'] = cats.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Cats {
  Cats({
    required this.id,
    required this.parentId,
    required this.image,
    required this.name,
    required this.catList,
    required this.color1,
    required this.color2,
  });
  late final int id;
  late final int parentId;
  late final int image;
  late final String name;
  late final List<CatList> catList;
  late final String color1;
  late final String color2;

  Cats.fromJson(Map<String, dynamic> json){
    id = json['id'];
    parentId = json['parentId'];
    image = json['image'];
    name = json['name'];
    catList = List.from(json['catList']).map((e)=>CatList.fromJson(e)).toList();
    color1 = json['color1'];
    color2 = json['color2'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parentId'] = parentId;
    _data['image'] = image;
    _data['name'] = name;
    _data['catList'] = catList.map((e)=>e.toJson()).toList();
    _data['color1'] = color1;
    _data['color2'] = color2;
    return _data;
  }
}

class CatList {
  CatList({
    required this.id,
    required this.parentId,
    required this.image,
    required this.name,
    required this.type,
  });
  late final int id;
  late final int parentId;
  late final int image;
  late final String name;
  late final String type;

  CatList.fromJson(Map<String, dynamic> json){
    id = json['id'];
    parentId = json['parentId'];
    image = json['image'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parentId'] = parentId;
    _data['image'] = image;
    _data['name'] = name;
    _data['type'] = type;
    return _data;
  }
}