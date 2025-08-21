import 'package:busca_cep/app/config/dependency_injection.dart';
import 'package:busca_cep/app/domain/models/endereco.dart';
import 'package:busca_cep/app/ui/history_page/view_models/history_viewmodel.dart';
import 'package:busca_cep/app/ui/history_page/widgets/history_address_card.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryViewModel historyViewModel = getIt.get<HistoryViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Histórico de pesquisas"),
      ),
      body: ListenableBuilder(
        listenable: historyViewModel,
        builder: (context, _) {
          return FutureBuilder<List<Endereco>?>(
            future: historyViewModel.enderecosPesquisados(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Endereco>?> snapshoot) {
              if (snapshoot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    Endereco endereco = snapshoot.data![index];

                    return HistoryAdddressCard(
                      endereco: endereco,
                      onDelete: historyViewModel.deletarEndereco,
                    );
                  },
                  itemCount: snapshoot.data!.length,
                );
              } else if (snapshoot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text("Falha ao buscar o histórico"));
              }
            },
          );
        },
      ),
    );
  }
}
