// To parse this JSON data, do
//
//     final addSingleContactModel = addSingleContactModelFromJson(jsonString);

import 'dart:convert';

AddSingleContactModel addSingleContactModelFromJson(String str) => AddSingleContactModel.fromJson(json.decode(str));

String addSingleContactModelToJson(AddSingleContactModel data) => json.encode(data.toJson());

class AddSingleContactModel {
    String? message;

    AddSingleContactModel({
        this.message,
    });

    AddSingleContactModel copyWith({
        String? message,
    }) => 
        AddSingleContactModel(
            message: message ?? this.message,
        );

    factory AddSingleContactModel.fromJson(Map<String, dynamic> json) => AddSingleContactModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
