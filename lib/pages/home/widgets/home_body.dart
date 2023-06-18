import 'package:exemplo_flutter/pages/home/widgets/item_lista_compras.dart';
import 'package:exemplo_flutter/provider/listas_provider.dart';
import 'package:exemplo_flutter/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Consumer<ListaComprasProvider>(
        builder: (context, value, child) {
          final listas = value.listas;

          return listas.isEmpty
              ? const MessageCard(
                  icon: Icon(Icons.remove_shopping_cart_outlined),
                  message: 'Nenhuma lista cadastrada...',
                )
              : ListView.builder(
                  itemCount: listas.length,
                  itemBuilder: (context, index) => ItemListaCompras(
                    listaCompra: listas[index],
                  ),
                );
        },
      ),
    );
  }
}
