import 'dart:convert';

import 'package:vrs/app/modules/students/model/student_model.dart';

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  int? codigo;
  String? descricao;
  String? ementa;
  List<StudentModel>? students;

  CourseModel({
    this.codigo,
    this.descricao,
    this.ementa,
    this.students,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    codigo: json['codigo'] as int?,
    descricao: json['descricao'] as String?,
    ementa: json['ementa'] as String?,
    students: StudentModel.fromJsonList(json['Students']),
  );

  Map<String, dynamic> toJson() => {
    "codigo": codigo,
    "descricao": descricao,
    "ementa": ementa,
    "students": students?.map((e) => e.toJson()).toList(),

  };

  factory CourseModel.fromJsonString(String str) => CourseModel.fromJson(json.decode(str));

  String toJsonString() => json.encode(toJson());

  static List<CourseModel>? fromJsonList(List<dynamic>? list) {
    if (list == null) return null;
    return list
        .map<CourseModel>((item) => CourseModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
