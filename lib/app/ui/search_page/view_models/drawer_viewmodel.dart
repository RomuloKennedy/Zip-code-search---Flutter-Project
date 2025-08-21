import 'package:busca_cep/app/data/services/language_service.dart';
import 'package:busca_cep/app/ui/search_page/widgets/drawer/language_bottom_sheet.dart';
import 'package:busca_cep/app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:busca_cep/app/config/dependency_injection.dart';

class DrawerViewModel extends ChangeNotifier {
  String idiomaSelecionado = AppStrings().selectedLanguage;
  final LanguageService languageService = getIt.get<LanguageService>();
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

  abrirSelecionarIdioma(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => LanguageBottomSheet(
        idiomas: idiomas,
        idiomaSelecionado: idiomaSelecionado,
        onIdiomaSelecionado: (idioma) async {
          idiomaSelecionado = idioma;
          await languageService.updateTagLanguage(idiomaSelecionado);
          notifyListeners();
        },
      ),
    );
  }
}
