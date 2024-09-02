import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrs/app/modules/courses/courses_controller.dart';
import 'package:vrs/app/modules/courses/model/course_model.dart';

class CourseDetailPage extends StatefulWidget {
  final CourseModel course;
  const CourseDetailPage({super.key, required this.course});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends ModularState<CourseDetailPage, CoursesController> {
  final _descricaoController = TextEditingController();
  final _ementaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializa os controladores com os valores atuais do curso
    _descricaoController.text = widget.course.descricao ?? '';
    _ementaController.text = widget.course.ementa ?? '';
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
        title: Text(widget.course.descricao ?? 'Sem descrição'),
        actions: [
          _editCourseButton(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  widget.course.descricao ?? 'Sem descrição',
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  widget.course.ementa ?? 'Sem ementa',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _editCourseButton() {
    return IconButton(
      onPressed: () => _showEditDialog(),
      icon: const Icon(Icons.edit),
    );
  }

  void _showEditDialog() {
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
                    _editCourse();
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

  void _editCourse() {
    final codigo = widget.course.codigo;
    final descricao = _descricaoController.text;
    final ementa = _ementaController.text;

    if (descricao.isNotEmpty && ementa.isNotEmpty) {
      final updatedCourse = CourseModel(
        codigo: codigo,
        descricao: descricao,
        ementa: ementa,
      );

      // Atualiza o curso através do controlador
      controller.updateCourse(codigo!.toInt(), updatedCourse);
    }
  }
}
