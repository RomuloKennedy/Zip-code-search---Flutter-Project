import 'package:busca_cep/app/config/dependency_injection.dart';
import 'package:busca_cep/app/data/services/language_service.dart';
import 'package:busca_cep/app/domain/models/address.dart';
import 'package:busca_cep/app/localization/translations.dart';
import 'package:busca_cep/app/utils/app_strings.dart';
import 'package:flutter/material.dart';

class HistoryAdddressCard extends StatelessWidget {
  HistoryAdddressCard(
      {super.key, required this.address, required this.onDelete});
  final Address address;
  final Function onDelete;
  String currentTagLanguage = getIt.get<LanguageService>().currentTagLanguage;
  AppStrings appStrings = AppStrings();

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
                  Text(appStrings.historyCardTextState),
                  Text(appStrings.historyCardTextCity),
                  Text(appStrings.historyCardTextDistrict),
                  Text(appStrings.historyCardTextStreet),
                  Text(appStrings.historyCardTextZipCode),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onDelete(address),
            ),
          ],
        ),
      ),
    );
  }
}
