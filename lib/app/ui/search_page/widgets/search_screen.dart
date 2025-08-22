import 'package:busca_cep/app/ui/search_page/view_models/search_viewmodel.dart';
import 'package:busca_cep/app/ui/search_page/widgets/zip_code_card.dart';
import 'package:busca_cep/app/ui/search_page/widgets/drawer/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:busca_cep/app/config/dependency_injection.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    SearchViewModel searchViewModel = getIt.get<SearchViewModel>();

    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text("Buscador de Endereço"),
        centerTitle: true,
      ),
      body: Center(
        child: ZipCodeCard(
          controller: controller,
          searchViewModel: searchViewModel,
        ),
      ),
    );
  }
}
