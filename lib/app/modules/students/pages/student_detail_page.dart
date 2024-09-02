import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrs/app/modules/students/model/student_model.dart';
import 'package:vrs/app/modules/students/students_controller.dart';

class StudentDetailPage extends StatefulWidget {
  final StudentModel student;
  const StudentDetailPage({super.key, required this.student});

  @override
  State<StudentDetailPage> createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends ModularState<StudentDetailPage, StudentsController> {
  final _nomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializa o controlador com o nome atual do aluno
    _nomeController.text = widget.student.nome ?? '';
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
        title: Text(widget.student.nome ?? 'Sem nome'),
        actions: [
          _editStudentButton(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(widget.student.nome ?? 'Sem nome', style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _editStudentButton() {
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
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _editStudent();
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

  void _editStudent() {
    final nome = _nomeController.text;
    final codigo = widget.student.codigo;

    if (nome.isNotEmpty) {
      final updatedStudent = StudentModel(
        codigo: codigo,  // Supondo que o StudentModel tem um campo id
        nome: nome,
        // Inclua outros campos se necessário
      );

      // Atualiza o aluno através do controlador
      controller.updateStudent(codigo!.toInt(), updatedStudent);
    }
  }
}
