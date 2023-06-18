import 'package:exemplo_flutter/pages/home/widgets/home_body.dart';
import 'package:exemplo_flutter/pages/home/widgets/home_bottom_app_bar.dart';
import 'package:exemplo_flutter/pages/home/widgets/home_fab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listas de Compras')),
      floatingActionButton: const HomeFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      bottomNavigationBar: const HomeBottomAppBar(),
      body: const HomeBody(),
    );
  }
}
