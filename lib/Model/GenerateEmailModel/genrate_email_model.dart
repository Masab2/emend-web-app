// To parse this JSON data, do
//
//     final generateEmailModel = generateEmailModelFromJson(jsonString);

import 'dart:convert';

GenerateEmailModel generateEmailModelFromJson(String str) => GenerateEmailModel.fromJson(json.decode(str));

String generateEmailModelToJson(GenerateEmailModel data) => json.encode(data.toJson());

class GenerateEmailModel {
    Email? email;

    GenerateEmailModel({
        this.email,
    });

    GenerateEmailModel copyWith({
        Email? email,
    }) => 
        GenerateEmailModel(
            email: email ?? this.email,
        );

    factory GenerateEmailModel.fromJson(Map<String, dynamic> json) => GenerateEmailModel(
        email: json["email"] == null ? null : Email.fromJson(json["email"]),
    );

    Map<String, dynamic> toJson() => {
        "email": email?.toJson(),
    };
}

class Email {
    EmailContent? emailContent;

    Email({
        this.emailContent,
    });

    Email copyWith({
        EmailContent? emailContent,
    }) => 
        Email(
            emailContent: emailContent ?? this.emailContent,
        );

    factory Email.fromJson(Map<String, dynamic> json) => Email(
        emailContent: json["email_content"] == null ? null : EmailContent.fromJson(json["email_content"]),
    );

    Map<String, dynamic> toJson() => {
        "email_content": emailContent?.toJson(),
    };
}

class EmailContent {
    String? body;
    String? subject;

    EmailContent({
        this.body,
        this.subject,
    });

    EmailContent copyWith({
        String? body,
        String? subject,
    }) => 
        EmailContent(
            body: body ?? this.body,
            subject: subject ?? this.subject,
        );

    factory EmailContent.fromJson(Map<String, dynamic> json) => EmailContent(
        body: json["body"],
        subject: json["subject"],
    );

    Map<String, dynamic> toJson() => {
        "body": body,
        "subject": subject,
    };
}
