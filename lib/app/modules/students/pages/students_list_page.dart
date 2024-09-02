import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrs/app/modules/students/model/student_model.dart';
import 'package:vrs/app/modules/students/students_controller.dart';

class StudentsPage extends StatefulWidget {
  final String title;

  const StudentsPage({Key? key, this.title = "Students"}) : super(key: key);

  @override
  StudentsPageState createState() => StudentsPageState();
}

class StudentsPageState extends ModularState<StudentsPage, StudentsController> {
  final _nomeController = TextEditingController();

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
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            _createStudentButton(),
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Observer(builder: (_) {
                return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, int index){
                          final student = controller.students[index];
                          return ListTile(
                            title: Text(student.nome.toString()),
                            onTap: () {
                              Modular.to.pushNamed('/home/students/detail',
                                  arguments: student, forRoot: true);
                            },
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(),
                        itemCount: controller.students.length));
              })
            ]));
  }

  Widget _createStudentButton() {
    return IconButton(
      onPressed: () => _showCreateStudentDialog(),
      icon: const Icon(Icons.add),
    );
  }

  void _showCreateStudentDialog() {
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
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
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
    final nome = _nomeController.text;

    if (nome.isNotEmpty) {
      final student = StudentModel(
        nome: nome,
      );

      controller.createStudent(student);
    }
  }
}
