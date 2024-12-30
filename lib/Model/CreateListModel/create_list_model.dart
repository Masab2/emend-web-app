// To parse this JSON data, do
//
//     final createListModel = createListModelFromJson(jsonString);

import 'dart:convert';

CreateListModel createListModelFromJson(String str) => CreateListModel.fromJson(json.decode(str));

String createListModelToJson(CreateListModel data) => json.encode(data.toJson());

class CreateListModel {
    String? message;
    ListClass? list;

    CreateListModel({
        this.message,
        this.list,
    });

    CreateListModel copyWith({
        String? message,
        ListClass? list,
    }) => 
        CreateListModel(
            message: message ?? this.message,
            list: list ?? this.list,
        );

    factory CreateListModel.fromJson(Map<String, dynamic> json) => CreateListModel(
        message: json["message"],
        list: json["list"] == null ? null : ListClass.fromJson(json["list"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "list": list?.toJson(),
    };
}

class ListClass {
    int? id;
    String? name;
    String? externalId;
    String? elasticId;
    int? userId;
    DateTime? createdAt;
    DateTime? updatedAt;

    ListClass({
        this.id,
        this.name,
        this.externalId,
        this.elasticId,
        this.userId,
        this.createdAt,
        this.updatedAt,
    });

    ListClass copyWith({
        int? id,
        String? name,
        String? externalId,
        String? elasticId,
        int? userId,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        ListClass(
            id: id ?? this.id,
            name: name ?? this.name,
            externalId: externalId ?? this.externalId,
            elasticId: elasticId ?? this.elasticId,
            userId: userId ?? this.userId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        id: json["id"],
        name: json["name"],
        externalId: json["externalId"],
        elasticId: json["elasticId"],
        userId: json["userId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "externalId": externalId,
        "elasticId": elasticId,
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
