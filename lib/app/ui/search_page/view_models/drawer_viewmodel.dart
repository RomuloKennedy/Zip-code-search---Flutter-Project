import 'package:busca_cep/app/data/services/language_service.dart';
import 'package:busca_cep/app/ui/search_page/view_models/search_viewmodel.dart';
import 'package:busca_cep/app/ui/search_page/widgets/drawer/language_bottom_sheet.dart';
import 'package:busca_cep/app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:busca_cep/app/config/dependency_injection.dart';

class DrawerViewModel extends ChangeNotifier {
  String selectedLanguage = AppStrings().selectedLanguage;
  final LanguageService languageService = getIt.get<LanguageService>();
  SearchViewModel searchViewModel = getIt.get<SearchViewModel>();
  final List<String> idiomas = [
    'Português',
    'Inglês',
    'Español',
    'हिंदी',
    'Bahasa Indonesia',
    'Русский',
    'Tiếng Việt',
    'ภาษาไทย',
    'Türkçe',
    'Filipino',
  ];

  openSelectedLanguage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => LanguageBottomSheet(
        languages: idiomas,
        selectedLanguage: selectedLanguage,
        onSelectedLanguage: (idioma) async {
          selectedLanguage = idioma;
          await languageService.updateTagLanguage(selectedLanguage);
          notifyListeners();
          searchViewModel.notifyListeners();
        },
      ),
    );
  }
}
