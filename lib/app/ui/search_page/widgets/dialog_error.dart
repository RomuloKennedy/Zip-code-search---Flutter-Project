import 'package:flutter/material.dart';

class DialogError extends StatelessWidget {
  const DialogError({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Falha ao buscar o endereço!'),
        actions: <Widget>[
          TextButton(
            onPressed: () => {Navigator.of(context).pop(true)},
            child: const Text('Ok.'),
          ),
        ],
      );
  }
}