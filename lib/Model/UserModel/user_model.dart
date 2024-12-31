// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? message;
    String? token;
    User? user;

    UserModel({
        this.message,
        this.token,
        this.user,
    });

    UserModel copyWith({
        String? message,
        String? token,
        User? user,
    }) => 
        UserModel(
            message: message ?? this.message,
            token: token ?? this.token,
            user: user ?? this.user,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? email;
    String? name;
    String? role;
    bool? isVerified;
    dynamic emailLimit;
    dynamic smsLimit;
    DateTime? createdAt;
    DateTime? updatedAt;

    User({
        this.id,
        this.email,
        this.name,
        this.role,
        this.isVerified,
        this.emailLimit,
        this.smsLimit,
        this.createdAt,
        this.updatedAt,
    });

    User copyWith({
        int? id,
        String? email,
        String? name,
        String? role,
        bool? isVerified,
        dynamic emailLimit,
        dynamic smsLimit,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        User(
            id: id ?? this.id,
            email: email ?? this.email,
            name: name ?? this.name,
            role: role ?? this.role,
            isVerified: isVerified ?? this.isVerified,
            emailLimit: emailLimit ?? this.emailLimit,
            smsLimit: smsLimit ?? this.smsLimit,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        role: json["role"],
        isVerified: json["isVerified"],
        emailLimit: json["emailLimit"],
        smsLimit: json["smsLimit"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "role": role,
        "isVerified": isVerified,
        "emailLimit": emailLimit,
        "smsLimit": smsLimit,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
