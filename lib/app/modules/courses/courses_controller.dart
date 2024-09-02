import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:vrs/app/modules/courses/model/course_model.dart';
import 'package:vrs/app/modules/courses/repository/courses_repository.dart';

part 'courses_controller.g.dart';

class CoursesController = _CoursesBase with _$CoursesController;

abstract class _CoursesBase with Store {
  var dio = Dio();
  late CoursesRepository repository;

  @observable
  late List<CourseModel> courses;

  _CoursesBase(this.repository) {
    getCourses();
  }

  @action
  Future<void> getCourses() async {
    courses = await repository.getCourses();
  }

  @action
  Future<void> createCourse(CourseModel course) async {
    await repository.postCourse(course);
    await getCourses();
  }

  @action
  Future<void> updateCourse(int codigo, CourseModel course) async {
    await repository.putCourse(codigo, course);
    await getCourses();
  }

  @action
  Future<void> deleteCourse(int codigo) async {
    await repository.deleteCourse(codigo);
    await getCourses();
  }
}
