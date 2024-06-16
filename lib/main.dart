import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ouchi_stocker/data/firebase_options.dart';
import 'package:ouchi_stocker/util/loggers/provider_logger.dart';
import 'package:ouchi_stocker/view/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      observers: [
        // Add a provider observer that logs all provider changes.
        ProviderLogger(),
      ],
      child: const App(),
    ),
  );
}
