import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrs/app/modules/courses/model/course_model.dart';

class CoursesRepository extends Disposable {
  final Dio dio;
  final SharedPreferences sharedPreferences;
  CoursesRepository(this.dio, this.sharedPreferences);
  String url = 'http://localhost:3000/api/course';

  Future<List<CourseModel>> getCourses() async {
    try {
      final response = await dio.get(url);

      var value = CourseModel.fromJsonList(response.data);

      sharedPreferences.setStringList("courses",
          value!.map((item) => item.toJsonString()).toList());

      return value;
    } catch (e) {
      var value = sharedPreferences.getStringList("courses");
      return value!.map((item) => CourseModel.fromJsonString(item)).toList();
    }
  }

  Future<void> postCourse(CourseModel course) async {
    try {
      await dio.post(url, data: course.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> putCourse(int codigo, CourseModel course) async {
    try {
      await dio.put('$url/$codigo', data: course.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteCourse(int codigo) async {
    try {
      await dio.delete('$url/$codigo');
    } catch (e) {
      print(e);
    }
  }

  // Dispose will be called automatically
  @override
  void dispose() {}
}
