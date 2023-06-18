import 'package:exemplo_flutter/model/setor.dart';
import 'package:exemplo_flutter/pages/setores/widgets/confirmation_dialog.dart';
import 'package:exemplo_flutter/pages/setores/widgets/item_setor.dart';
import 'package:exemplo_flutter/provider/setores_provider.dart';
import 'package:exemplo_flutter/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetoresPage extends StatefulWidget {
  const SetoresPage({super.key});

  @override
  State<SetoresPage> createState() => _SetoresPageState();
}

class _SetoresPageState extends State<SetoresPage> {
  final _textFieldController = TextEditingController();
  late SetoresProvider _setoresProvider;
  Setor? _setor;

  @override
  void initState() {
    _setoresProvider = Provider.of<SetoresProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _textFieldController.text = _setor?.descricao ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setores'),
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
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Descrição do setor',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                FilledButton(
                  onPressed: _onSave,
                  child: const Text('Salvar'),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Consumer<SetoresProvider>(
              builder: (context, value, child) {
                final setores = value.setores;
                return setores.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: setores.length,
                          itemBuilder: (context, index) => ItemSetor(
                            setor: setores[index],
                            onDelete: () => _onDelete(setores[index]),
                            onEdit: () => _onEdit(setores[index]),
                          ),
                        ),
                      )
                    : const MessageCard(
                        icon: Icon(Icons.category_outlined),
                        message: 'Nenhum setor cadastrado...',
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onSave() {
    if (_setor != null) {
      _setor!.descricao = _textFieldController.text;

      _setoresProvider.update(_setor!);

      setState(() {
        _setor = null;
      });
      return;
    }

    _setoresProvider.add(
      Setor(descricao: _textFieldController.text),
    );
    setState(() {
      _setor = null;
    });
  }

  void _onEdit(Setor setor) {
    setState(() {
      _setor = setor;
    });
  }

  void _onDelete(Setor setor) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        setor: setor,
        onConfirm: () {
          _setoresProvider.remove(setor);

          setState(() {
            _setor = null;
          });

          Navigator.pop(context);
        },
      ),
    );
  }
}
