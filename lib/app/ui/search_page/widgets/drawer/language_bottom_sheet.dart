import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  final List<String> idiomas;
  final String idiomaSelecionado;
  final Function(String) onIdiomaSelecionado;

  const LanguageBottomSheet({
    super.key,
    required this.idiomas,
    required this.idiomaSelecionado,
    required this.onIdiomaSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: idiomas.map((idioma) {
        return ListTile(
          title: Text(idioma),
          trailing: idioma == idiomaSelecionado
              ? const Icon(Icons.check, color: Colors.green)
              : null,
          onTap: () async {
            await onIdiomaSelecionado(idioma);
            Navigator.pop(context);
          },
        );
      }).toList(),
    );
  }
}