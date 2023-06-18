import 'package:exemplo_flutter/model/lista_compra.dart';
import 'package:exemplo_flutter/pages/lista_compra/lista_compra_page.dart';
import 'package:flutter/material.dart';

class ItemListaCompras extends StatelessWidget {
  final ListaCompra listaCompra;

  const ItemListaCompras({
    super.key,
    required this.listaCompra,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        title: Text(
          listaCompra.descricao,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          listaCompra.setor?.descricao ?? 'Sem setor',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: 'Editar lista',
              icon: const Icon(Icons.edit_rounded),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ListaCompraPage(
                    listaCompra: listaCompra,
                  ),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
