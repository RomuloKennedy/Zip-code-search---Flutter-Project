import 'package:busca_cep/app/config/dependency_injection.dart';
import 'package:busca_cep/app/config/sentry.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await initSentry();
}


