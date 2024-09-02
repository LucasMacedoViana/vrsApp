
import 'dart:convert';

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel{
  int? codigo;
  String? nome;

  StudentModel({
    this.codigo,
    this.nome,
  });

  factory StudentModel.fromJson(Map<dynamic, dynamic> json) => StudentModel(
    codigo: json['codigo'],
    nome: json['nome'],
  );

  Map<dynamic,dynamic> toJson() => {
    "codigo": codigo,
    "nome": nome,
  };

  factory StudentModel.fromJsonString(String str) => StudentModel.fromJson(json.decode(str));

  String toJsonString() => json.encode(toJson());

  static List<StudentModel>? fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<StudentModel>((item) => StudentModel.fromJson(item))
        .toList();
  }
}