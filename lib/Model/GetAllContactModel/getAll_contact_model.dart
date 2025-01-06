// To parse this JSON data, do
//
//     final getAllContacts = getAllContactsFromJson(jsonString);

import 'dart:convert';

GetAllContacts getAllContactsFromJson(String str) => GetAllContacts.fromJson(json.decode(str));

String getAllContactsToJson(GetAllContacts data) => json.encode(data.toJson());

class GetAllContacts {
    List<Datum>? data;

    GetAllContacts({
        this.data,
    });

    GetAllContacts copyWith({
        List<Datum>? data,
    }) => 
        GetAllContacts(
            data: data ?? this.data,
        );

    factory GetAllContacts.fromJson(Map<String, dynamic> json) => GetAllContacts(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
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

    Datum({
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

    Datum copyWith({
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
        Datum(
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
