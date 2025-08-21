import 'package:busca_cep/app/my_app.dart';
import 'package:busca_cep/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> initSentry() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          Constants.sentry;
      options.sendDefaultPii = true;
    },
    appRunner: () => runApp(
      SentryWidget(
        child: const MyApp(),
      ),
    ),
  );
}
