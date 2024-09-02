// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentsController on _StudentsControllerBase, Store {
  late final _$studentsAtom =
      Atom(name: '_StudentsControllerBase.students', context: context);

  @override
  List<StudentModel> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  bool _studentsIsInitialized = false;

  @override
  set students(List<StudentModel> value) {
    _$studentsAtom
        .reportWrite(value, _studentsIsInitialized ? super.students : null, () {
      super.students = value;
      _studentsIsInitialized = true;
    });
  }

  late final _$getStudentsAsyncAction =
      AsyncAction('_StudentsControllerBase.getStudents', context: context);

  @override
  Future<void> getStudents() {
    return _$getStudentsAsyncAction.run(() => super.getStudents());
  }

  late final _$createStudentAsyncAction =
      AsyncAction('_StudentsControllerBase.createStudent', context: context);

  @override
  Future<void> createStudent(StudentModel student) {
    return _$createStudentAsyncAction.run(() => super.createStudent(student));
  }

  late final _$updateStudentAsyncAction =
      AsyncAction('_StudentsControllerBase.updateStudent', context: context);

  @override
  Future<void> updateStudent(int codigo, StudentModel student) {
    return _$updateStudentAsyncAction
        .run(() => super.updateStudent(codigo, student));
  }

  late final _$deleteStudentAsyncAction =
      AsyncAction('_StudentsControllerBase.deleteStudent', context: context);

  @override
  Future<void> deleteStudent(int codigo) {
    return _$deleteStudentAsyncAction.run(() => super.deleteStudent(codigo));
  }

  @override
  String toString() {
    return '''
students: ${students}
    ''';
  }
}
