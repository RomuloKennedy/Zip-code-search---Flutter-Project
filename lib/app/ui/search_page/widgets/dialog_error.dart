import 'package:busca_cep/app/utils/app_strings.dart';
import 'package:flutter/material.dart';

class DialogError extends StatelessWidget {
  DialogError({super.key});
  AppStrings appStrings = AppStrings();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(appStrings.searchDialogFailureMessage),
        actions: <Widget>[
          TextButton(
            onPressed: () => {Navigator.of(context).pop(true)},
            child: Text(appStrings.searchDialogFailureConfirm),
          ),
        ],
      );
  }
}