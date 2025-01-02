// To parse this JSON data, do
//
//     final generateSmsModel = generateSmsModelFromJson(jsonString);

import 'dart:convert';

GenerateSmsModel generateSmsModelFromJson(String str) => GenerateSmsModel.fromJson(json.decode(str));

String generateSmsModelToJson(GenerateSmsModel data) => json.encode(data.toJson());

class GenerateSmsModel {
    Sms? sms;

    GenerateSmsModel({
        this.sms,
    });

    GenerateSmsModel copyWith({
        Sms? sms,
    }) => 
        GenerateSmsModel(
            sms: sms ?? this.sms,
        );

    factory GenerateSmsModel.fromJson(Map<String, dynamic> json) => GenerateSmsModel(
        sms: json["sms"] == null ? null : Sms.fromJson(json["sms"]),
    );

    Map<String, dynamic> toJson() => {
        "sms": sms?.toJson(),
    };
}

class Sms {
    String? smsContent;

    Sms({
        this.smsContent,
    });

    Sms copyWith({
        String? smsContent,
    }) => 
        Sms(
            smsContent: smsContent ?? this.smsContent,
        );

    factory Sms.fromJson(Map<String, dynamic> json) => Sms(
        smsContent: json["sms_content"],
    );

    Map<String, dynamic> toJson() => {
        "sms_content": smsContent,
    };
}
