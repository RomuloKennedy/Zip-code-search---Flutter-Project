import 'package:busca_cep/app/config/dependency_injection.dart';
import 'package:busca_cep/app/data/services/language_service.dart';
import 'package:busca_cep/app/domain/models/endereco.dart';
import 'package:busca_cep/app/localization/translations.dart';
import 'package:flutter/material.dart';

class HistoryAdddressCard extends StatelessWidget {
  HistoryAdddressCard(
      {super.key, required this.endereco, required this.onDelete});
  final Endereco endereco;
  final Function onDelete;
  String currentTagLanguage = getIt.get<LanguageService>().currentTagLanguage;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${translations[currentTagLanguage]!['history-card-text-state']}: ${endereco.uf}"),
                  Text(
                      "${translations[currentTagLanguage]!['history-card-text-city']}: ${endereco.localidade}"),
                  Text(
                      "${translations[currentTagLanguage]!['history-card-text-district']}: ${endereco.bairro}"),
                  Text(
                      "${translations[currentTagLanguage]!['history-card-text-road']}: ${endereco.logradouro}"),
                  Text(
                      "${translations[currentTagLanguage]!['history-card-text-zip-code']}: ${endereco.cep}"),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onDelete(endereco),
            ),
          ],
        ),
      ),
    );
  }
}
