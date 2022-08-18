import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:real_cafe/provider/address_provider.dart';
import 'package:real_cafe/provider/cart_provider.dart';
import 'package:real_cafe/screens/splash_screen.dart';
import 'package:real_cafe/utilities/constants.dart';

import 'firebase_options.dart';
import 'provider/favourites_provider.dart';
import 'provider/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouritesProvider()),
        ChangeNotifierProvider(create: (_) => CartItemProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => UserDetailsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
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
      home: const SplashScreen(),
      // home: FutureBuilder(
      //   future: AuthMethods()
      //       .getUser(
      //           uid: FirebaseAuth.instance.currentUser != null
      //               ? FirebaseAuth.instance.currentUser!.uid
      //               : null)
      //       .then((value) {
      //     if (value != null) {
      //       context
      //           .read<UserProvider>()
      //           .setUser(user: model.User.fromMap(value));
      //     }
      //     return value;
      //   }),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const LoadingIndicator();
      //     } else if (snapshot.hasData) {
      //       return const HomeScreen();
      //     }
      //     return const OnBoardingScreen();
      //   },
      // ),
    );
  }
}
