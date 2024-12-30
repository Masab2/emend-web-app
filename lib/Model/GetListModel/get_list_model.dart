// To parse this JSON data, do
//
//     final getListModel = getListModelFromJson(jsonString);

import 'dart:convert';

GetListModel getListModelFromJson(String str) => GetListModel.fromJson(json.decode(str));

String getListModelToJson(GetListModel data) => json.encode(data.toJson());

class GetListModel {
    List<ListElement>? list;

    GetListModel({
        this.list,
    });

    GetListModel copyWith({
        List<ListElement>? list,
    }) => 
        GetListModel(
            list: list ?? this.list,
        );

    factory GetListModel.fromJson(Map<String, dynamic> json) => GetListModel(
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    int? id;
    String? name;
    String? externalId;
    String? elasticId;
    int? userId;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Contact>? contacts;

    ListElement({
        this.id,
        this.name,
        this.externalId,
        this.elasticId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.contacts,
    });

    ListElement copyWith({
        int? id,
        String? name,
        String? externalId,
        String? elasticId,
        int? userId,
        DateTime? createdAt,
        DateTime? updatedAt,
        List<Contact>? contacts,
    }) => 
        ListElement(
            id: id ?? this.id,
            name: name ?? this.name,
            externalId: externalId ?? this.externalId,
            elasticId: elasticId ?? this.elasticId,
            userId: userId ?? this.userId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            contacts: contacts ?? this.contacts,
        );

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        name: json["name"],
        externalId: json["externalId"],
        elasticId: json["elasticId"],
        userId: json["userId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        contacts: json["contacts"] == null ? [] : List<Contact>.from(json["contacts"]!.map((x) => Contact.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "externalId": externalId,
        "elasticId": elasticId,
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "contacts": contacts == null ? [] : List<dynamic>.from(contacts!.map((x) => x.toJson())),
    };
}

class Contact {
    int? id;
    String? firstName;
    String? lastName;
    String? phone;
    String? email;
    String? externalId;
    int? userId;
    int? listId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Contact({
        this.id,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.externalId,
        this.userId,
        this.listId,
        this.createdAt,
        this.updatedAt,
    });

    Contact copyWith({
        int? id,
        String? firstName,
        String? lastName,
        String? phone,
        String? email,
        String? externalId,
        int? userId,
        int? listId,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Contact(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            phone: phone ?? this.phone,
            email: email ?? this.email,
            externalId: externalId ?? this.externalId,
            userId: userId ?? this.userId,
            listId: listId ?? this.listId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        email: json["email"],
        externalId: json["externalId"],
        userId: json["userId"],
        listId: json["listId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "externalId": externalId,
        "userId": userId,
        "listId": listId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
