class GetKeranjang {
  String? code;
  String? info;
  List<DataGetKeranjang>? data;

  GetKeranjang({this.code, this.info, this.data});

  GetKeranjang.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    if (json['data'] != null) {
      data = <DataGetKeranjang>[];
      json['data'].forEach((v) {
        data!.add(DataGetKeranjang.fromJson(v));
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

class DataGetKeranjang {
  int? id;
  int? userId;
  int? productId;
  int? qty;
  String? createdAt;
  String? updatedAt;
  ProductGetKeranjang? product;

  DataGetKeranjang(
      {this.id,
      this.userId,
      this.productId,
      this.qty,
      this.createdAt,
      this.updatedAt,
      this.product});

  DataGetKeranjang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    qty = json['qty'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null
        ? ProductGetKeranjang.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['qty'] = qty;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class ProductGetKeranjang {
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
  String? deletedAt;

  ProductGetKeranjang(
      {this.id,
      this.name,
      this.categoryId,
      this.image,
      this.imagePath,
      this.harga,
      this.deskripsi,
      this.stock,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ProductGetKeranjang.fromJson(Map<String, dynamic> json) {
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
    deletedAt = json['deleted_at'];
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
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class CreateKeranjang {
  String? code;
  String? info;
  DataCreateKeranjang? data;

  CreateKeranjang({this.code, this.info, this.data});

  CreateKeranjang.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    data = json['data'] != null
        ? DataCreateKeranjang.fromJson(json['data'])
        : null;
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

class DataCreateKeranjang {
  String? productId;
  String? qty;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataCreateKeranjang(
      {this.productId,
      this.qty,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  DataCreateKeranjang.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    qty = json['qty'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['qty'] = qty;
    data['user_id'] = userId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class DeleteKeranjang {
  String? code;
  String? info;

  DeleteKeranjang({this.code, this.info});

  DeleteKeranjang.fromJson(Map<String, dynamic> json) {
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
