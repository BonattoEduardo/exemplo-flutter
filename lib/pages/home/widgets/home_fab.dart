import 'package:exemplo_flutter/pages/lista_compra/lista_compra_page.dart';
import 'package:flutter/material.dart';

class HomeFAB extends StatelessWidget {
  const HomeFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ListaCompraPage(),
          ),
        );
      },
      icon: const Icon(Icons.add_rounded),
      label: const Text('Nova Lista'),
    );
  }
}
