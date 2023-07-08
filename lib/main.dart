import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_iffan_cuaca/provider/cuaca_provider.dart';
import 'package:uas_iffan_cuaca/screen/cuaca_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CuacaProvider>(
          create: (context) => CuacaProvider(),
        ),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}