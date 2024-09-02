
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrs/app/modules/students/model/student_model.dart';

class StudentsRepository extends Disposable{
  final Dio dio;
  final SharedPreferences sharedPreferences;
  StudentsRepository(this.dio, this.sharedPreferences);
  String url = 'http://localhost:3000/api/student';

  Future<List<StudentModel>> getStudents() async {
    try {
      final response = await dio.get(url);

      var value = StudentModel.fromJsonList(response.data);

      sharedPreferences.setStringList("students",
          value!.map((item) => item.toJsonString()).toList());

      return value;
    } catch (e) {
      var value = sharedPreferences.getStringList("students");
      return value!.map((item) => StudentModel.fromJsonString(item)).toList();
    }
  }

  Future<void> postStudent(StudentModel student) async {
    try {
      await dio.post(url, data: student.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> putStudent(int codigo, StudentModel student) async {
    try {
      await dio.put('$url/$codigo', data: student.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteStudent(int codigo) async {
    try {
      await dio.delete('$url/$codigo');
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {}
}