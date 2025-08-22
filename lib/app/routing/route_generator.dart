import 'package:busca_cep/app/domain/models/address.dart';
import 'package:busca_cep/app/ui/history_page/widgets/history_screen.dart';
import 'package:busca_cep/app/ui/result_page/widgets/result_screen.dart';
import 'package:busca_cep/app/ui/search_page/widgets/search_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case '/result_page':
        if (arg is Address) {
          return MaterialPageRoute(
              builder: (_) => ResultScreen(
                    endereco: arg,
                  ));
        } else {
          return errorRoute("Objeto invalido");
        }
      case '/history_page':
        return MaterialPageRoute(builder: (_) => const HistoryScreen());

      default:
        return errorRoute("Rota ${settings.name} não encontrada");
    }
  }

  static Route<dynamic> errorRoute(String erro) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Erro no uso da rota'),
        ),
        body: Center(
          child: Text(erro),
        ),
      );
    });
  }
}
