import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:vrs/app/modules/students/model/student_model.dart';
import 'package:vrs/app/modules/students/repository/students_repository.dart';

part 'students_controller.g.dart';

class StudentsController = _StudentsControllerBase with _$StudentsController;

abstract class _StudentsControllerBase with Store {
  var dio = Dio();
  late StudentsRepository repository;

  @observable
  late List<StudentModel> students;

  _StudentsControllerBase(this.repository){
    getStudents();
  }

  @action
  Future<void> getStudents() async {
    students = await repository.getStudents();
  }

  @action
  Future<void> createStudent(StudentModel student) async {
    await repository.postStudent(student);
    await getStudents();
  }

  @action
  Future<void> updateStudent(int codigo, StudentModel student) async {
    await repository.putStudent(codigo, student);
    await getStudents();
  }

  @action
  Future<void> deleteStudent(int codigo) async {
    await repository.deleteStudent(codigo);
    await getStudents();
  }
}