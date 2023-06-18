import 'package:exemplo_flutter/provider/setores_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PickSetorDialog extends StatelessWidget {
  const PickSetorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Escolha um setor'),
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 300,
          child: Consumer<SetoresProvider>(
            builder: (context, value, child) => ListView.builder(
              shrinkWrap: true,
              itemCount: value.setores.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(value.setores[index].descricao),
                onTap: () => Navigator.of(context).pop(value.setores[index]),
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
