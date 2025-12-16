import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/routes/routes.dart';
import 'package:widget_app/presentation/providers/providers.dart';
import 'package:widget_app/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        title: 'Forex News',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        home: const HomePage(),
      ),
    );
  }
}
