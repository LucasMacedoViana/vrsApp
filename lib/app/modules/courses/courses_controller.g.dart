// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoursesController on _CoursesBase, Store {
  late final _$coursesAtom =
      Atom(name: '_CoursesBase.courses', context: context);

  @override
  List<CourseModel> get courses {
    _$coursesAtom.reportRead();
    return super.courses;
  }

  bool _coursesIsInitialized = false;

  @override
  set courses(List<CourseModel> value) {
    _$coursesAtom
        .reportWrite(value, _coursesIsInitialized ? super.courses : null, () {
      super.courses = value;
      _coursesIsInitialized = true;
    });
  }

  late final _$getCoursesAsyncAction =
      AsyncAction('_CoursesBase.getCourses', context: context);

  @override
  Future<void> getCourses() {
    return _$getCoursesAsyncAction.run(() => super.getCourses());
  }

  late final _$createCourseAsyncAction =
      AsyncAction('_CoursesBase.createCourse', context: context);

  @override
  Future<void> createCourse(CourseModel course) {
    return _$createCourseAsyncAction.run(() => super.createCourse(course));
  }

  late final _$updateCourseAsyncAction =
      AsyncAction('_CoursesBase.updateCourse', context: context);

  @override
  Future<void> updateCourse(int codigo, CourseModel course) {
    return _$updateCourseAsyncAction
        .run(() => super.updateCourse(codigo, course));
  }

  late final _$deleteCourseAsyncAction =
      AsyncAction('_CoursesBase.deleteCourse', context: context);

  @override
  Future<void> deleteCourse(int codigo) {
    return _$deleteCourseAsyncAction.run(() => super.deleteCourse(codigo));
  }

  @override
  String toString() {
    return '''
courses: ${courses}
    ''';
  }
}
