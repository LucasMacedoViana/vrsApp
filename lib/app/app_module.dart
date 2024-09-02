import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrs/app/app_controller.dart';
import 'package:vrs/app/modules/courses/courses_module.dart';
import 'package:vrs/app/modules/students/students_module.dart';

import 'modules/home/home_module.dart';
import 'modules/home/home_page.dart';

class AppModule extends Module {
  final SharedPreferences sharedPreferences;
  AppModule(this.sharedPreferences);

  @override
  List<Bind> get binds => [
    Bind((i) => AppController()),
    Bind((i) => sharedPreferences),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ChildRoute('/home', child: (_, __) => const HomePage(), children: [
      ModuleRoute('/courses', module: CoursesModule()),
      ModuleRoute('/courses/detail', module: CoursesModule()),
      ModuleRoute('/students', module: StudentsModule()),
      ModuleRoute('/students/detail', module: StudentsModule()),
    ]),
  ];

  @override
  Widget get bootstrap => const HomePage();
}