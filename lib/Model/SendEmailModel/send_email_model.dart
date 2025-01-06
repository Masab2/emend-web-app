// To parse this JSON data, do
//
//     final sendEmailModel = sendEmailModelFromJson(jsonString);

import 'dart:convert';

SendEmailModel sendEmailModelFromJson(String str) => SendEmailModel.fromJson(json.decode(str));

String sendEmailModelToJson(SendEmailModel data) => json.encode(data.toJson());

class SendEmailModel {
    String? message;
    Response? response;

    SendEmailModel({
        this.message,
        this.response,
    });

    SendEmailModel copyWith({
        String? message,
        Response? response,
    }) => 
        SendEmailModel(
            message: message ?? this.message,
            response: response ?? this.response,
        );

    factory SendEmailModel.fromJson(Map<String, dynamic> json) => SendEmailModel(
        message: json["message"],
        response: json["response"] == null ? null : Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "response": response?.toJson(),
    };
}

class Response {
    String? transactionId;
    String? messageId;

    Response({
        this.transactionId,
        this.messageId,
    });

    Response copyWith({
        String? transactionId,
        String? messageId,
    }) => 
        Response(
            transactionId: transactionId ?? this.transactionId,
            messageId: messageId ?? this.messageId,
        );

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        transactionId: json["TransactionID"],
        messageId: json["MessageID"],
    );

    Map<String, dynamic> toJson() => {
        "TransactionID": transactionId,
        "MessageID": messageId,
    };
}
