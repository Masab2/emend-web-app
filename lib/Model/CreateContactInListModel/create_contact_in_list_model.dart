// To parse this JSON data, do
//
//     final createContactInListModel = createContactInListModelFromJson(jsonString);

import 'dart:convert';

CreateContactInListModel createContactInListModelFromJson(String str) => CreateContactInListModel.fromJson(json.decode(str));

String createContactInListModelToJson(CreateContactInListModel data) => json.encode(data.toJson());

class CreateContactInListModel {
    String? message;

    CreateContactInListModel({
        this.message,
    });

    CreateContactInListModel copyWith({
        String? message,
    }) => 
        CreateContactInListModel(
            message: message ?? this.message,
        );

    factory CreateContactInListModel.fromJson(Map<String, dynamic> json) => CreateContactInListModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
