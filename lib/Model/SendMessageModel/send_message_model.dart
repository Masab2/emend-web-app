// To parse this JSON data, do
//
//     final sendMessageModel = sendMessageModelFromJson(jsonString);

import 'dart:convert';

SendMessageModel sendMessageModelFromJson(String str) => SendMessageModel.fromJson(json.decode(str));

String sendMessageModelToJson(SendMessageModel data) => json.encode(data.toJson());

class SendMessageModel {
    Message? message;

    SendMessageModel({
        this.message,
    });

    SendMessageModel copyWith({
        Message? message,
    }) => 
        SendMessageModel(
            message: message ?? this.message,
        );

    factory SendMessageModel.fromJson(Map<String, dynamic> json) => SendMessageModel(
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message?.toJson(),
    };
}

class Message {
    int? id;
    String? content;
    String? direction;
    int? userId;
    int? contactId;
    dynamic conversationId;
    String? externalId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Message({
        this.id,
        this.content,
        this.direction,
        this.userId,
        this.contactId,
        this.conversationId,
        this.externalId,
        this.createdAt,
        this.updatedAt,
    });

    Message copyWith({
        int? id,
        String? content,
        String? direction,
        int? userId,
        int? contactId,
        dynamic conversationId,
        String? externalId,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Message(
            id: id ?? this.id,
            content: content ?? this.content,
            direction: direction ?? this.direction,
            userId: userId ?? this.userId,
            contactId: contactId ?? this.contactId,
            conversationId: conversationId ?? this.conversationId,
            externalId: externalId ?? this.externalId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        content: json["content"],
        direction: json["direction"],
        userId: json["userId"],
        contactId: json["contactId"],
        conversationId: json["conversationId"],
        externalId: json["externalId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "direction": direction,
        "userId": userId,
        "contactId": contactId,
        "conversationId": conversationId,
        "externalId": externalId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
