import 'package:busca_cep/app/domain/models/address.dart';
import 'package:busca_cep/app/ui/result_page/widgets/result_endereco_card.dart';
import 'package:busca_cep/app/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.endereco});
  final Address endereco;
  AppStrings appStrings = AppStrings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appStrings.resultScreenTitle),
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
