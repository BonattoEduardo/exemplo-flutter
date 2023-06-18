import 'package:exemplo_flutter/model/setor.dart';

class ListaCompra {
  static int _id = 0;

  final int id = _id++;
  String descricao;

  Setor? setor;

  ListaCompra({
    required this.descricao,
    this.setor,
  });
}
