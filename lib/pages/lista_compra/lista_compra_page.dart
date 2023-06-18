import 'package:exemplo_flutter/model/lista_compra.dart';
import 'package:exemplo_flutter/model/setor.dart';
import 'package:exemplo_flutter/pages/lista_compra/widgets/pick_setor_dialog.dart';
import 'package:exemplo_flutter/provider/listas_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaCompraPage extends StatefulWidget {
  final ListaCompra? listaCompra;

  const ListaCompraPage({
    super.key,
    this.listaCompra,
  });

  @override
  State<ListaCompraPage> createState() => _ListaCompraPageState();
}

class _ListaCompraPageState extends State<ListaCompraPage> {
  final _descricaoListaController = TextEditingController();
  final _descricaoSetorController = TextEditingController();
  late ListaComprasProvider _listaComprasProvider;

  ListaCompra? _listaCompra;

  @override
  void initState() {
    _listaCompra = widget.listaCompra;
    _listaComprasProvider = Provider.of<ListaComprasProvider>(
      context,
      listen: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _descricaoListaController.text = _listaCompra?.descricao ?? '';
    _descricaoSetorController.text = _listaCompra?.setor?.descricao ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _descricaoListaController,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Descrição da lista',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                FilledButton(
                  onPressed: _onSaveDescricao,
                  child: const Text('Salvar'),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            if (_listaCompra != null)
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _descricaoSetorController,
                      enabled: false,
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: 'Setor',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _onPickSetor,
                    icon: const Icon(
                      Icons.menu_open_rounded,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _onSaveDescricao() {
    if (_listaCompra != null) {
      _listaCompra!.descricao = _descricaoListaController.text;
      _listaComprasProvider.update(_listaCompra!);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lista editada com sucesso!'),
        ),
      );
      return;
    }

    final newListaCompra = ListaCompra(
      descricao: _descricaoListaController.text,
    );
    _listaComprasProvider.add(newListaCompra);

    setState(() {
      _listaCompra = newListaCompra;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Lista criada com sucesso!'),
      ),
    );
  }

  void _onPickSetor() {
    showDialog<Setor?>(
      context: context,
      builder: (context) => const PickSetorDialog(),
    ).then((setor) {
      if (setor == null || _listaCompra == null) {
        return;
      }

      setState(() {
        _listaCompra!.setor = setor;
      });

      _listaComprasProvider.update(_listaCompra!);
    });
  }
}
