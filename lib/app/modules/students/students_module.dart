import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrs/app/modules/students/pages/student_detail_page.dart';
import 'package:vrs/app/modules/students/repository/students_repository.dart';
import 'package:vrs/app/modules/students/students_controller.dart';
import 'package:vrs/app/modules/students/pages/students_list_page.dart';

class StudentsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => StudentsRepository(Dio(), i.get())),
    Bind((i) => StudentsController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const StudentsPage(), transition: TransitionType.fadeIn),
    ChildRoute('/detail', child: (_, args) => StudentDetailPage(student: args.data), transition: TransitionType.downToUp),
  ];
}