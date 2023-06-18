import 'dart:collection';

import 'package:exemplo_flutter/model/lista_compra.dart';
import 'package:flutter/material.dart';

class ListaComprasProvider extends ChangeNotifier {
  final _listas = <ListaCompra>[];

  UnmodifiableListView<ListaCompra> get listas => UnmodifiableListView(_listas);

  void add(ListaCompra listaCompra) {
    _listas.add(listaCompra);
    notifyListeners();
  }

  void update(ListaCompra listaCompra) {
    final index = _listas.indexWhere((l) => l.id == listaCompra.id);
    _listas[index] = listaCompra;
    notifyListeners();
  }
}
