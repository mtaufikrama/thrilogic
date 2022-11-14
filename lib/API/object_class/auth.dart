class Register {
  String? code;
  String? info;
  DataRegister? data;

  Register({this.code, this.info, this.data});

  Register.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    data = json['data'] != null ? DataRegister.fromJson(json['data']) : null;
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

class DataRegister {
  UserRegister? user;

  DataRegister({this.user});

  DataRegister.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserRegister.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class UserRegister {
  String? name;
  String? handphone;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserRegister(
      {this.name,
      this.handphone,
      this.email,
      this.updatedAt,
      this.createdAt,
      this.id});

  UserRegister.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    handphone = json['handphone'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['handphone'] = handphone;
    data['email'] = email;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class Login {
  String? code;
  String? info;
  DataLogin? data;

  Login({this.code, this.info, this.data});

  Login.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    info = json['info'];
    data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
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

class DataLogin {
  UserLogin? user;
  String? token;

  DataLogin({this.user, this.token});

  DataLogin.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserLogin.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class UserLogin {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? handphone;
  String? createdAt;
  String? updatedAt;
  String? role;

  UserLogin(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.handphone,
      this.createdAt,
      this.updatedAt,
      this.role});

  UserLogin.fromJson(Map<String, dynamic> json) {
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

class Logout {
  String? code;
  String? info;

  Logout({this.code, this.info});

  Logout.fromJson(Map<String, dynamic> json) {
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
