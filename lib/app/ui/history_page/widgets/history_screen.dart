import 'package:busca_cep/app/config/dependency_injection.dart';
import 'package:busca_cep/app/domain/models/address.dart';
import 'package:busca_cep/app/ui/history_page/view_models/history_viewmodel.dart';
import 'package:busca_cep/app/ui/history_page/widgets/history_address_card.dart';
import 'package:busca_cep/app/utils/app_strings.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryViewModel historyViewModel = getIt.get<HistoryViewModel>();
  AppStrings appStrings = AppStrings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appStrings.historyTitle),
      ),
      body: ListenableBuilder(
        listenable: historyViewModel,
        builder: (context, _) {
          return FutureBuilder<List<Address>?>(
            future: historyViewModel.addressesSearched(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Address>?> snapshoot) {
              if (snapshoot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    Address address = snapshoot.data![index];

                    return HistoryAdddressCard(
                      address: address,
                      onDelete: historyViewModel.deleteAddress,
                    );
                  },
                  itemCount: snapshoot.data!.length,
                );
              } else if (snapshoot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Center(child: Text(appStrings.historyFailureMessage));
              }
            },
          );
        },
      ),
    );
  }
}
