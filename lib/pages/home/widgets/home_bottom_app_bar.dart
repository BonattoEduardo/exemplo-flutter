import 'package:exemplo_flutter/pages/setores/setores_page.dart';
import 'package:flutter/material.dart';

enum Options { setores }

class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          PopupMenuButton(
            tooltip: 'Opções',
            icon: const Icon(Icons.menu_rounded),
            onSelected: (value) => switch (value) {
              Options.setores => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SetoresPage(),
                  ),
                ),
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: Options.setores,
                child: Text('Gerenciar setores...'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
