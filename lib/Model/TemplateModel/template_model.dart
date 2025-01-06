// To parse this JSON data, do
//
//     final templateModel = templateModelFromJson(jsonString);

import 'dart:convert';

TemplateModel templateModelFromJson(String str) =>
    TemplateModel.fromJson(json.decode(str));

String templateModelToJson(TemplateModel data) => json.encode(data.toJson());

class TemplateModel {
  final List<Template>? templates;

  TemplateModel({
    this.templates,
  });

  TemplateModel copyWith({
    List<Template>? templates,
  }) =>
      TemplateModel(
        templates: templates ?? this.templates,
      );

  factory TemplateModel.fromJson(Map<String, dynamic> json) => TemplateModel(
        templates: json["templates"] == null
            ? []
            : List<Template>.from(
                json["templates"]!.map((x) => Template.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "templates": templates == null
            ? []
            : List<dynamic>.from(templates!.map((x) => x.toJson())),
      };
}

class Template {
  final int? id;
  final int? userId;
  final String? name;
  final String? template;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Template({
    this.id,
    this.userId,
    this.name,
    this.template,
    this.createdAt,
    this.updatedAt,
  });

  Template copyWith({
    int? id,
    int? userId,
    String? name,
    String? template,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Template(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        template: template ?? this.template,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Template.fromJson(Map<String, dynamic> json) => Template(
        id: json["id"],
        userId: json["userId"],
        name: json["name"],
        template: json["template"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "name": name,
        "template": template,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
