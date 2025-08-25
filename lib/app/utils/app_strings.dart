import 'package:busca_cep/app/data/services/language_service.dart';
import 'package:busca_cep/app/localization/translations.dart';
import 'package:busca_cep/app/config/dependency_injection.dart';

class AppStrings{
  String tagLanguage = getIt<LanguageService>().currentTagLanguage;

  String get searchTitle => translations[tagLanguage]!['search-title']!;
  String get searchButton => translations[tagLanguage]!['search-button']!;
  String get searchHistoryButton => translations[tagLanguage]!['search-history-button']!;
  String get searchCardTitle => translations[tagLanguage]!['search-card-title']!;
  String get searchInputPlaceholder => translations[tagLanguage]!['search-input-placeholder']!;
  String get searchDialogFailureMessage => translations[tagLanguage]!['search-dialog-failure-message']!;
  String get searchDialogFailureConfirm => translations[tagLanguage]!['search-dialog-failure-confirm']!;
  String get resultScreenTitle => translations[tagLanguage]!['result-screen-title']!;
  String get historyTitle => translations[tagLanguage]!['history-title']!;
  String get historyCardTextState => translations[tagLanguage]!['history-card-text-state']!;
  String get historyCardTextCity => translations[tagLanguage]!['history-card-text-city']!;
  String get historyCardTextDistrict => translations[tagLanguage]!['history-card-text-district']!;
  String get historyCardTextStreet => translations[tagLanguage]!['history-card-text-street']!;
  String get historyCardTextZipCode => translations[tagLanguage]!['history-card-text-zip-code']!;
  String get historyFailureMessage => translations[tagLanguage]!['history-failure-message']!;
  String get language => translations[tagLanguage]!['language']!;
  String get menu => translations[tagLanguage]!['menu']!;
  String get selectedLanguage => translations[tagLanguage]!['selected-language']!;
}