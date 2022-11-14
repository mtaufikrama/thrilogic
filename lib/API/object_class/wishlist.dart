class GetWishlist {
  String? code;
  String? info;
  List<DataGetWishlist>? data;

  GetWishlist({this.code, this.info, this.data});

  GetWishlist.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    if (json['data'] != null) {
      data = <DataGetWishlist>[];
      json['data'].forEach((v) {
        data!.add(DataGetWishlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['info'] = info;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataGetWishlist {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ProductGetWishlist? product;

  DataGetWishlist(
      {this.id,
      this.productId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.product});

  DataGetWishlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null
        ? ProductGetWishlist.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class ProductGetWishlist {
  int? id;
  String? name;
  int? categoryId;
  String? image;
  String? imagePath;
  int? harga;
  String? deskripsi;
  int? stock;
  String? createdAt;
  String? updatedAt;

  ProductGetWishlist(
      {this.id,
      this.name,
      this.categoryId,
      this.image,
      this.imagePath,
      this.harga,
      this.deskripsi,
      this.stock,
      this.createdAt,
      this.updatedAt});

  ProductGetWishlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    image = json['image'];
    imagePath = json['image_path'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    stock = json['stock'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['image'] = image;
    data['image_path'] = imagePath;
    data['harga'] = harga;
    data['deskripsi'] = deskripsi;
    data['stock'] = stock;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CreateWishlist {
  String? code;
  String? info;
  DataCreateWishlist? data;

  CreateWishlist({this.code, this.info, this.data});

  CreateWishlist.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    data =
        json['data'] != null ? DataCreateWishlist.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['info'] = info;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataCreateWishlist {
  String? productId;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataCreateWishlist(
      {this.productId, this.userId, this.updatedAt, this.createdAt, this.id});

  DataCreateWishlist.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class DeleteWishlist {
  String? code;
  String? info;

  DeleteWishlist({this.code, this.info});

  DeleteWishlist.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['info'] = info;
    return data;
  }
}
