import 'dart:collection';

import 'package:exemplo_flutter/model/setor.dart';
import 'package:flutter/material.dart';

class SetoresProvider extends ChangeNotifier {
  final _setores = <Setor>[];

  UnmodifiableListView<Setor> get setores => UnmodifiableListView(_setores);

  void add(Setor setor) {
    _setores.add(setor);
    notifyListeners();
  }

  void update(Setor setor) {
    final index = _setores.indexWhere((s) => s.id == setor.id);
    _setores[index] = setor;
    notifyListeners();
  }

  void remove(Setor setor) {
    _setores.removeWhere((s) => s.id == setor.id);
    notifyListeners();
  }
}
