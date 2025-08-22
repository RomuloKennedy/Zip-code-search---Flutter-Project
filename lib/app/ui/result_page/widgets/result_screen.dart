import 'package:busca_cep/app/domain/models/address.dart';
import 'package:busca_cep/app/ui/result_page/widgets/result_endereco_card.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.endereco});
  final Address endereco;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página de Resultado"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResultAddressCard(
            address: endereco,
          ),
        ],
      )),
    );
  }
}
