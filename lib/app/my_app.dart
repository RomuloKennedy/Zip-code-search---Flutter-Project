import 'package:flutter/material.dart';
import 'package:busca_cep/app/routing/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: "/",
    );
  }
}