import 'package:busca_cep/app/config/local_database.dart';
import 'package:busca_cep/app/data/repositories/language_repository.dart';
import 'package:busca_cep/app/data/services/api_client_service.dart';
import 'package:busca_cep/app/data/services/language_service.dart';
import 'package:busca_cep/app/ui/history_page/view_models/history_viewmodel.dart';
import 'package:busca_cep/app/ui/search_page/view_models/drawer_viewmodel.dart';
import 'package:busca_cep/app/ui/search_page/view_models/search_viewmodel.dart';
import 'package:busca_cep/app/utils/constants.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await setUpConfig();
  await setUpRepositories();
  await setUpServices();
  await viewModel();
}

Future<void> setUpConfig() async {
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => LocalDatabase());
  await getIt.get<LocalDatabase>().initLocalDB();
  getIt.registerLazySingleton(() => Constants());
}

Future<void> setUpRepositories()async{
  getIt.registerLazySingleton(() => LanguageRepository(localDatabase: getIt()));
}
Future<void> setUpServices() async {
  getIt.registerLazySingleton(() =>
      ApiClientService(endpoint: Constants.endpoint, httpClient: getIt()));
  getIt.registerLazySingleton(() => LanguageService(languageRepository: getIt()));
  await getIt.get<LanguageService>().getTagLanguage();
}

Future<void> viewModel() async {
  getIt.registerLazySingleton(() => SearchViewModel());
  getIt.registerLazySingleton(() => HistoryViewModel());
  getIt.registerLazySingleton(() => DrawerViewModel());
}
