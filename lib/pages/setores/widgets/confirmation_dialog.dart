import 'package:exemplo_flutter/model/setor.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final Setor setor;
  final VoidCallback? onCancel;
  final VoidCallback onConfirm;
  const ConfirmationDialog({
    super.key,
    required this.setor,
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Remover Setor'),
      content: Text(
        'Deseja remover o setor "${setor.descricao}"?',
      ),
      actions: [
        TextButton(
          onPressed: onCancel ?? () => Navigator.pop(context),
          child: const Text('Não'),
        ),
        TextButton(
          onPressed: onConfirm,
          child: const Text('Sim'),
        ),
      ],
    );
  }
}
