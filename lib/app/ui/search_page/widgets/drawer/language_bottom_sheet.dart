import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  final List<String> languages;
  final String selectedLanguage;
  final Function(String) onSelectedLanguage;

  const LanguageBottomSheet({
    super.key,
    required this.languages,
    required this.selectedLanguage,
    required this.onSelectedLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: languages.map((language) {
        return ListTile(
          title: Text(language),
          trailing: language == selectedLanguage
              ? const Icon(Icons.check, color: Colors.green)
              : null,
          onTap: () async {
            await onSelectedLanguage(language);
            Navigator.pop(context);
          },
        );
      }).toList(),
    );
  }
}
