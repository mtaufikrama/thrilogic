class GetKategori {
  String? code;
  String? info;
  List<DataGetKategori>? data;

  GetKategori({this.code, this.info, this.data});

  GetKategori.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    if (json['data'] != null) {
      data = <DataGetKategori>[];
      json['data'].forEach((v) {
        data!.add(DataGetKategori.fromJson(v));
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

class DataGetKategori {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  DataGetKategori({this.id, this.name, this.createdAt, this.updatedAt});

  DataGetKategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class GetKategoriById {
  String? code;
  String? info;
  DataGetKategoriById? data;

  GetKategoriById({this.code, this.info, this.data});

  GetKategoriById.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    data = json['data'] != null
        ? DataGetKategoriById.fromJson(json['data'])
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

class DataGetKategoriById {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<ProductsGetKategoriById>? products;

  DataGetKategoriById(
      {this.id, this.name, this.createdAt, this.updatedAt, this.products});

  DataGetKategoriById.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <ProductsGetKategoriById>[];
      json['products'].forEach((v) {
        products!.add(ProductsGetKategoriById.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsGetKategoriById {
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

  ProductsGetKategoriById(
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

  ProductsGetKategoriById.fromJson(Map<String, dynamic> json) {
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

class CreateKategori {
  String? code;
  String? info;
  DataCreateKategori? data;

  CreateKategori({this.code, this.info, this.data});

  CreateKategori.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    data =
        json['data'] != null ? DataCreateKategori.fromJson(json['data']) : null;
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

class DataCreateKategori {
  String? name;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataCreateKategori({this.name, this.updatedAt, this.createdAt, this.id});

  DataCreateKategori.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class UpdateKategori {
  String? code;
  String? info;
  DataUpdateKategori? data;

  UpdateKategori({this.code, this.info, this.data});

  UpdateKategori.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    data =
        json['data'] != null ? DataUpdateKategori.fromJson(json['data']) : null;
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

class DataUpdateKategori {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  DataUpdateKategori({this.id, this.name, this.createdAt, this.updatedAt});

  DataUpdateKategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class DeleteKategori {
  String? code;
  String? info;

  DeleteKategori({this.code, this.info});

  DeleteKategori.fromJson(Map<String, dynamic> json) {
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
