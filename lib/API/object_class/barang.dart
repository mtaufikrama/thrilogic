class GetBarang {
  String? code;
  String? info;
  String? message;
  List<DataGetBarang>? data;

  GetBarang({this.code, this.info, this.data, this.message});

  GetBarang.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataGetBarang>[];
      json['data'].forEach((v) {
        data!.add(DataGetBarang.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['info'] = info;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataGetBarang {
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
  CategoryGetBarang? category;

  DataGetBarang(
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
      this.category});

  DataGetBarang.fromJson(Map<String, dynamic> json) {
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
    category = json['category'] != null
        ? CategoryGetBarang.fromJson(json['category'])
        : null;
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class CategoryGetBarang {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  CategoryGetBarang({this.id, this.name, this.createdAt, this.updatedAt});

  CategoryGetBarang.fromJson(Map<String, dynamic> json) {
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

class GetBarangById {
  String? code;
  String? info;
  DataGetBarangById? data;

  GetBarangById({this.code, this.info, this.data});

  GetBarangById.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    data =
        json['data'] != null ? DataGetBarangById.fromJson(json['data']) : null;
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

class DataGetBarangById {
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
  CategoryGetBarangById? category;

  DataGetBarangById({
    this.id,
    this.name,
    this.categoryId,
    this.image,
    this.imagePath,
    this.harga,
    this.deskripsi,
    this.stock,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  DataGetBarangById.fromJson(Map<String, dynamic> json) {
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
    category = json['category'] != null
        ? CategoryGetBarangById.fromJson(json['category'])
        : null;
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class CategoryGetBarangById {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  CategoryGetBarangById({this.id, this.name, this.createdAt, this.updatedAt});

  CategoryGetBarangById.fromJson(Map<String, dynamic> json) {
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

class CreateBarang {
  String? code;
  String? info;
  DataCreateBarang? data;

  CreateBarang({this.code, this.info, this.data});

  CreateBarang.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    data =
        json['data'] != null ? DataCreateBarang.fromJson(json['data']) : null;
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

class DataCreateBarang {
  String? name;
  String? categoryId;
  String? stock;
  String? deskripsi;
  String? harga;
  String? image;
  String? imagePath;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataCreateBarang(
      {this.name,
      this.categoryId,
      this.stock,
      this.deskripsi,
      this.harga,
      this.image,
      this.imagePath,
      this.updatedAt,
      this.createdAt,
      this.id});

  DataCreateBarang.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    categoryId = json['category_id'];
    stock = json['stock'];
    deskripsi = json['deskripsi'];
    harga = json['harga'];
    image = json['image'];
    imagePath = json['image_path'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['category_id'] = categoryId;
    data['stock'] = stock;
    data['deskripsi'] = deskripsi;
    data['harga'] = harga;
    data['image'] = image;
    data['image_path'] = imagePath;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class UpdateBarang {
  String? code;
  String? info;
  DataUpdateBarang? data;

  UpdateBarang({this.code, this.info, this.data});

  UpdateBarang.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    data =
        json['data'] != null ? DataUpdateBarang.fromJson(json['data']) : null;
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

class DataUpdateBarang {
  int? id;
  String? name;
  String? categoryId;
  String? image;
  String? imagePath;
  String? harga;
  String? deskripsi;
  String? stock;
  String? createdAt;
  String? updatedAt;

  DataUpdateBarang({
    this.id,
    this.name,
    this.categoryId,
    this.image,
    this.imagePath,
    this.harga,
    this.deskripsi,
    this.stock,
    this.createdAt,
    this.updatedAt,
  });

  DataUpdateBarang.fromJson(Map<String, dynamic> json) {
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

class DeleteBarang {
  String? code;
  String? info;

  DeleteBarang({this.code, this.info});

  DeleteBarang.fromJson(Map<String, dynamic> json) {
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
