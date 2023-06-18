import 'package:exemplo_flutter/model/setor.dart';
import 'package:flutter/material.dart';

class ItemSetor extends StatelessWidget {
  final Setor setor;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ItemSetor({
    super.key,
    required this.setor,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        title: Text(
          setor.descricao,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: 'Editar Setor',
              icon: const Icon(Icons.edit_rounded),
              onPressed: onEdit,
            ),
            IconButton(
              tooltip: 'Remover Setor',
              icon: const Icon(Icons.delete_rounded),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
