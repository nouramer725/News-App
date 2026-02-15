import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/home/search/search_screen.dart';
import 'package:news_app/provider/app_language_provider.dart';
import 'package:news_app/provider/app_theme_provider.dart';
import 'package:news_app/provider/shared_preferences_language.dart';
import 'package:news_app/provider/shared_preferences_theme.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:news_app/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'home/category_screen/category.dart';
import 'home/category_screen/category_fragment.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesLanguage.init();
  await SharedPreferencesTheme.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (_) => AppThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    SizeConfig.init(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Flutter Demo',
      locale: Locale(languageProvider.appLocal),
      themeMode: themeProvider.appTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.categoryScreenName,
      routes: {
        AppRoutes.categoryScreenName: (context) => CategoryFragment(),
        AppRoutes.searchScreen: (context) => SearchScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.homeScreenName) {
          final category = settings.arguments as Category;
          return MaterialPageRoute(
            builder: (_) => HomeScreen(category: category),
          );
        }
        return null;
      },
    );
  }
}
