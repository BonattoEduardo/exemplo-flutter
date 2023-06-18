class Setor {
  static int _id = 0;

  final int id = _id++;
  String descricao;

  Setor({
    required this.descricao,
  });
}
