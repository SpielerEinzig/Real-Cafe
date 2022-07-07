import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:real_cafe/provider/cart_provider.dart';
import 'package:real_cafe/screens/home_page.dart';
import 'package:real_cafe/utilities/constants.dart';

import 'provider/favourites_provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavouritesProvider()),
          ChangeNotifierProvider(create: (_) => CartItemProvider()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const HomePage(),
      theme: ThemeData.dark().copyWith(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: kPrimary, foregroundColor: kPrimary),
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
        scaffoldBackgroundColor: kBackgroundColor,
        colorScheme: ColorScheme.fromSwatch(
          primaryColorDark: kPrimary,
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}
