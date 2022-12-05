class GetReview {
  String? code;
  String? info;
  int? totalReview;
  List<DataGetReview>? data;

  GetReview({this.code, this.info, this.totalReview, this.data});

  GetReview.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    totalReview = json['total review'];
    if (json['data'] != null) {
      data = <DataGetReview>[];
      json['data'].forEach((v) {
        data!.add(DataGetReview.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['info'] = info;
    data['total review'] = totalReview;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataGetReview {
  int? id;
  int? productId;
  int? userId;
  int? star;
  String? review;
  String? image;
  String? imagePath;
  String? createdAt;
  String? updatedAt;
  UserGetReview? user;

  DataGetReview(
      {this.id,
      this.productId,
      this.userId,
      this.star,
      this.review,
      this.image,
      this.imagePath,
      this.createdAt,
      this.updatedAt,
      this.user});

  DataGetReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    star = json['star'];
    review = json['review'];
    image = json['image'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserGetReview.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['star'] = star;
    data['review'] = review;
    data['image'] = image;
    data['image_path'] = imagePath;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class UserGetReview {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? handphone;
  String? createdAt;
  String? updatedAt;
  String? role;

  UserGetReview(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.handphone,
      this.createdAt,
      this.updatedAt,
      this.role});

  UserGetReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    handphone = json['handphone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['handphone'] = handphone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['role'] = role;
    return data;
  }
}

class CreateReview {
  String? code;
  String? info;
  String? message;
  DataCreateReview? data;

  CreateReview({this.code, this.info, this.data, this.message});

  CreateReview.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    message = json['message'];
    data =
        json['data'] != null ? DataCreateReview.fromJson(json['data']) : null;
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

class DataCreateReview {
  int? userId;
  int? productId;
  String? star;
  String? review;
  String? image;
  String? imagePath;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataCreateReview(
      {this.userId,
      this.productId,
      this.star,
      this.review,
      this.image,
      this.imagePath,
      this.updatedAt,
      this.createdAt,
      this.id});

  DataCreateReview.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
    star = json['star'];
    review = json['review'];
    image = json['image'];
    imagePath = json['image_path'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['star'] = star;
    data['review'] = review;
    data['image'] = image;
    data['image_path'] = imagePath;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class DeleteReview {
  String? code;
  String? info;

  DeleteReview({this.code, this.info});

  DeleteReview.fromJson(Map<String, dynamic> json) {
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
