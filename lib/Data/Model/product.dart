class Details {
  Details({
    required this.id,
    required this.coverImage,
    required this.matgarImage,
    required this.name,
    required this.catName,
    required this.address,
    required this.description,
    required this.url,
    required this.face,
    required this.whats,
    required this.rate,
    required this.rateCount,
    required this.images,
    required this.comments,
    required this.services,
    required this.offers,
    required this.products,
    required this.lat,
    required this.lng,
  });
  late final int id;
  late final int coverImage;
  late final int matgarImage;
  late final String name;
  late final String catName;
  late final String address;
  late final String description;
  late final String url;
  late final String face;
  late final String whats;
  late final double rate;
  late final int rateCount;
  late final List<int> images;
  late final List<dynamic> comments;
  late final List<dynamic> services;
  late final List<dynamic> offers;
  late final List<Products> products;
  late final double lat;
  late final double lng;

  Details.fromJson(Map<String, dynamic> json){
    id = json['id'];
    coverImage = json['coverImage'];
    matgarImage = json['matgarImage'];
    name = json['name'];
    catName = json['catName'];
    address = json['address'];
    description = json['description'];
    url = json['url'];
    face = json['face'];
    whats = json['whats'];
    rate = json['rate'];
    rateCount = json['rateCount'];
    images = List.castFrom<dynamic, int>(json['images']);
    comments = List.castFrom<dynamic, dynamic>(json['comments']);
    services = List.castFrom<dynamic, dynamic>(json['services']);
    offers = List.castFrom<dynamic, dynamic>(json['offers']);
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['coverImage'] = coverImage;
    _data['matgarImage'] = matgarImage;
    _data['name'] = name;
    _data['catName'] = catName;
    _data['address'] = address;
    _data['description'] = description;
    _data['url'] = url;
    _data['face'] = face;
    _data['whats'] = whats;
    _data['rate'] = rate;
    _data['rateCount'] = rateCount;
    _data['images'] = images;
    _data['comments'] = comments;
    _data['services'] = services;
    _data['offers'] = offers;
    _data['products'] = products.map((e)=>e.toJson()).toList();
    _data['lat'] = lat;
    _data['lng'] = lng;
    return _data;
  }
}

class Products {
  Products({
    required this.id,
    required this.rateCount,
    required this.matgarId,
    required this.name,
    required this.catName,
    required this.priceAfter,
    required this.isFavourite,
    required this.rate,
    required this.images,
  });
  late final int id;
  late final int rateCount;
  late final int matgarId;
  late final String name;
  late final String catName;
  late final String priceAfter;
  late final bool isFavourite;
  late final double rate;
  late final List<int> images;

  Products.fromJson(Map<String, dynamic> json){
    id = json['id'];
    rateCount = json['rateCount'];
    matgarId = json['matgarId'];
    name = json['name'];
    catName = json['catName'];
    priceAfter = json['priceAfter'];
    isFavourite = json['isFavourite'];
    rate = json['rate'];
    images = List.castFrom<dynamic, int>(json['images']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['rateCount'] = rateCount;
    _data['matgarId'] = matgarId;
    _data['name'] = name;
    _data['catName'] = catName;
    _data['priceAfter'] = priceAfter;
    _data['isFavourite'] = isFavourite;
    _data['rate'] = rate;
    _data['images'] = images;
    return _data;
  }
}