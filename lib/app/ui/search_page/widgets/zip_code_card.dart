import 'package:busca_cep/app/ui/search_page/view_models/search_viewmodel.dart';
import 'package:busca_cep/app/ui/search_page/widgets/dialog_error.dart';
import 'package:busca_cep/app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ZipCodeCard extends StatelessWidget {
  ZipCodeCard(
      {super.key, required this.controller, required this.searchViewModel});
  final TextEditingController controller;
  final SearchViewModel searchViewModel;
  AppStrings appStrings = AppStrings();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                appStrings.searchCardTitle,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: appStrings.searchInputPlaceholder,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      searchViewModel.buscarEndereco(controller.text, context);
                    },
                    icon: const Icon(Icons.search),
                    label: Text(appStrings.searchButton),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      searchViewModel.historyPage(context);
                    },
                    icon: const Icon(Icons.history),
                    label: Text(appStrings.searchHistoryButton),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
