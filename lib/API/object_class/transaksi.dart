class GetTransaksi {
  String? code;
  String? info;
  List<DataGetTransaksi>? data;

  GetTransaksi({this.code, this.info, this.data});

  GetTransaksi.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    if (json['data'] != null) {
      data = <DataGetTransaksi>[];
      json['data'].forEach((v) {
        data!.add(DataGetTransaksi.fromJson(v));
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

class DataGetTransaksi {
  int? id;
  int? total;
  String? status;
  String? alamat;
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<ProductsGetTransaksi>? products;

  DataGetTransaksi(
      {this.id,
      this.total,
      this.status,
      this.alamat,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.products});

  DataGetTransaksi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    status = json['status'];
    alamat = json['alamat'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <ProductsGetTransaksi>[];
      json['products'].forEach((v) {
        products!.add(ProductsGetTransaksi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total'] = total;
    data['status'] = status;
    data['alamat'] = alamat;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsGetTransaksi {
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
  PivotGetTransaksi? pivot;

  ProductsGetTransaksi(
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
      this.pivot});

  ProductsGetTransaksi.fromJson(Map<String, dynamic> json) {
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
    pivot = json['pivot'] != null
        ? PivotGetTransaksi.fromJson(json['pivot'])
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
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class PivotGetTransaksi {
  int? transactionId;
  int? productId;
  int? qty;

  PivotGetTransaksi({this.transactionId, this.productId, this.qty});

  PivotGetTransaksi.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    productId = json['product_id'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_id'] = transactionId;
    data['product_id'] = productId;
    data['qty'] = qty;
    return data;
  }
}

class CreateTransaksi {
  String? code;
  String? info;
  String? message;
  DataCreateTransaksi? data;

  CreateTransaksi({this.code, this.info, this.data, this.message});

  CreateTransaksi.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    message = json['message'];
    data = json['data'] != null
        ? DataCreateTransaksi.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['info'] = info;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataCreateTransaksi {
  String? alamat;
  String? status;
  int? userId;
  int? total;
  String? updatedAt;
  String? createdAt;
  int? id;
  List<ProductsCreateTransaksi>? products;

  DataCreateTransaksi(
      {this.alamat,
      this.status,
      this.userId,
      this.total,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.products});

  DataCreateTransaksi.fromJson(Map<String, dynamic> json) {
    alamat = json['alamat'];
    status = json['status'];
    userId = json['user_id'];
    total = json['total'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    if (json['products'] != null) {
      products = <ProductsCreateTransaksi>[];
      json['products'].forEach((v) {
        products!.add(ProductsCreateTransaksi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alamat'] = alamat;
    data['status'] = status;
    data['user_id'] = userId;
    data['total'] = total;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsCreateTransaksi {
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
  PivotCreateTransaksi? pivot;

  ProductsCreateTransaksi(
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
      this.deletedAt,
      this.pivot});

  ProductsCreateTransaksi.fromJson(Map<String, dynamic> json) {
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
    pivot = json['pivot'] != null
        ? PivotCreateTransaksi.fromJson(json['pivot'])
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
    data['deleted_at'] = deletedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class PivotCreateTransaksi {
  int? transactionId;
  int? productId;
  int? qty;

  PivotCreateTransaksi({this.transactionId, this.productId, this.qty});

  PivotCreateTransaksi.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    productId = json['product_id'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_id'] = transactionId;
    data['product_id'] = productId;
    data['qty'] = qty;
    return data;
  }
}
