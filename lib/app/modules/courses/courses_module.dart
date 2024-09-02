
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrs/app/modules/courses/courses_controller.dart';
import 'package:vrs/app/modules/courses/pages/course_detail_page.dart';
import 'package:vrs/app/modules/courses/pages/courses_list_page.dart';
import 'package:vrs/app/modules/courses/repository/courses_repository.dart';
class CoursesModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = [
    Bind((i) => CoursesRepository(Dio(), i.get())),
    Bind((i) => CoursesController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const CoursesPage(), transition: TransitionType.fadeIn),
    ChildRoute('/detail', child: (_, args) => CourseDetailPage(course: args.data), transition: TransitionType.downToUp),
  ];
}