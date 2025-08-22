import 'package:busca_cep/app/domain/models/address.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:sentry_flutter/sentry_flutter.dart';

class ApiClientService {
  final String endpoint;
  final Client httpClient;

  ApiClientService({required this.endpoint, required this.httpClient});
  Future<Address> buscarEndereco(String zipCode) async {
    try {
      Response response = await httpClient.post(Uri.parse("$endpoint/$zipCode"));
      Map<String, dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      Address address = Address.fromJson(body);
      return address;
    } catch (e) {
      Sentry.captureException(e);
      throw Exception("Erro");
    }
  }

  enderecosPesquisados() async {
    try {
      Response response = await httpClient.get(Uri.parse(endpoint));
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<Address> addressList = Address.fromJsonToEnderecoList(body);

      return addressList;
    } catch (e) {
      Sentry.captureException(e);
      throw Exception();
    }
  }

  deleteSearch(Address address) async {
    try {
      await httpClient.delete(Uri.parse("$endpoint/${address.id}"));
    } catch (e) {
      Sentry.captureException(e);
    }
  }
}
