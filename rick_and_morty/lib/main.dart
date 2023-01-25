import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/home/presentation/page/home_page.dart';
import 'package:rick_and_morty/injection.dart';
import 'package:rick_and_morty/shared/theme/application_theme.dart';
import 'package:rick_and_morty/shared/theme/data/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    DevicePreview(
      builder: (_) {
        return const RickAndMortyApp();
      },
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ApplicationTheme.themes[AppTheme.dark]?.themeData,
      home: const HomePage(),
    );
  }
}
