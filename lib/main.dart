import 'package:exemplo_flutter/pages/home/home_page.dart';
import 'package:exemplo_flutter/provider/listas_provider.dart';
import 'package:exemplo_flutter/provider/setores_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SetoresProvider()),
        ChangeNotifierProvider(create: (_) => ListaComprasProvider()),
      ],
      child: MaterialApp(
        title: 'Listas de Compras',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.amberAccent,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
