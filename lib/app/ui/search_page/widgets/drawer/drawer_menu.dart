import 'package:busca_cep/app/config/dependency_injection.dart';
import 'package:busca_cep/app/ui/search_page/view_models/drawer_viewmodel.dart';
import 'package:busca_cep/app/utils/app_strings.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    DrawerViewModel drawerViewModel = getIt.get<DrawerViewModel>();

    return ListenableBuilder(
        listenable: drawerViewModel,
        builder: (context, _) {
          AppStrings appStrings = AppStrings();
          return Drawer(
            child: ListView(
              padding: const EdgeInsets.only(top: 30.0),
              children: [
                ListTile(
                  tileColor: colorScheme.primary,
                  title: Text(
                    appStrings.menu,
                    style: TextStyle(color: colorScheme.onPrimary),
                  ),
                  dense: true,
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(
                      '${appStrings.language}: ${drawerViewModel.idiomaSelecionado}'),
                  onTap: () => drawerViewModel.abrirSelecionarIdioma(context),
                ),
              ],
            ),
          );
        });
  }
}
