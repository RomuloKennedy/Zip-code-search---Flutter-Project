import 'package:busca_cep/app/config/dependency_injection.dart';
import 'package:busca_cep/app/data/services/api_client_service.dart';
import 'package:busca_cep/app/domain/models/address.dart';
import 'package:flutter/material.dart';

class HistoryViewModel extends ChangeNotifier {
  final ApiClientService api = getIt.get<ApiClientService>();

  Future<List<Address>?> addressesSearched() async {
    return await api.enderecosPesquisados();
  }

  deleteAddress(Address address) async {
    await api.deleteSearch(address);
    notifyListeners();
  }
}
