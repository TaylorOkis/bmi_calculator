import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/app_router.dart';
import 'controllers/gender_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider<GenderNotifier>(
      create: (_) => GenderNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
