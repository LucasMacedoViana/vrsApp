import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrs/app/modules/courses/courses_controller.dart';
import 'package:vrs/app/modules/courses/model/course_model.dart';

class CoursesPage extends StatefulWidget {
  final String title;

  const CoursesPage({Key? key, this.title = 'Cursos'}) : super(key: key);

  @override
  CoursesPageState createState() => CoursesPageState();
}

class CoursesPageState extends ModularState<CoursesPage, CoursesController> {
  final _descricaoController = TextEditingController();
  final _ementaController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    _ementaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          _createCourseButton(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Observer(
            builder: (_) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.courses.length,
                  itemBuilder: (context, int index) {
                    if (index >= controller.courses.length) {
                      return const SizedBox(
                        height: 50,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    final course = controller.courses[index];

                    return ListTile(
                      title: Text(course.descricao.toString()),
                      subtitle: Text(course.ementa.toString()),
                      onTap: () {
                        Modular.to.pushNamed('/home/courses/detail',
                            arguments: course, forRoot: true);
                      },
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _createCourseButton() {
    return IconButton(
      onPressed: () => _showCreateCourseDialog(),
      icon: const Icon(Icons.add),
    );
  }

  void _showCreateCourseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _descricaoController,
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _ementaController,
                  decoration: const InputDecoration(
                    labelText: 'Ementa',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _createCourse();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _createCourse() {
    final descricao = _descricaoController.text;
    final ementa = _ementaController.text;

    if (descricao.isNotEmpty && ementa.isNotEmpty) {
      final course = CourseModel(
        descricao: descricao,
        ementa: ementa,
      );

      controller.createCourse(course);
    }
  }
}
