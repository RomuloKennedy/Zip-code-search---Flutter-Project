import 'package:busca_cep/app/domain/models/endereco.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:sentry_flutter/sentry_flutter.dart';

class ApiClientService {
  final String endpoint;
  final Client httpClient;

  ApiClientService({required this.endpoint, required this.httpClient});
  Future<Endereco> buscarEndereco(String cep) async {
    try {
      Response response = await httpClient.post(Uri.parse("$endpoint/$cep"));
      Map<String, dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      Endereco endereco = Endereco.fromJson(body);
      return endereco;
    } catch (e) {
      Sentry.captureException(e);
      throw Exception("Erro");
    }
  }

  enderecosPesquisados() async {
    try {
      Response response = await httpClient.get(Uri.parse(endpoint));
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<Endereco> listaDeEnderecos = Endereco.fromJsonToEnderecoList(body);

      return listaDeEnderecos;
    } catch (e) {
      Sentry.captureException(e);
      throw Exception();
    }
  }

  deletarPesquisa(Endereco endereco) async {
    try {
      await httpClient.delete(Uri.parse("$endpoint/${endereco.id}"));
    } catch (e) {
      Sentry.captureException(e);
    }
  }
}
