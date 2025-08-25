import 'package:busca_cep/app/config/dependency_injection.dart';
import 'package:busca_cep/app/data/services/api_client_service.dart';
import 'package:busca_cep/app/domain/models/address.dart';
import 'package:busca_cep/app/ui/search_page/widgets/dialog_error.dart';
import 'package:flutter/material.dart';

class SearchViewModel {
  final ApiClientService api = getIt.get<ApiClientService>();

  buscarEndereco(String cep, context) async {
    try {
      Address endereco = await api.buscarEndereco(cep);
      Navigator.pushNamed(context, '/result_page', arguments: endereco);
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogError();
        },
      );
    }
  }

  historyPage(context) {
    Navigator.pushNamed(context, '/history_page');
  }
}
