import 'package:flutter/material.dart';
import 'package:serenitys/shared/theme.dart';
import 'package:serenitys/ui/pages/detail_screen.dart';
import 'package:serenitys/ui/pages/home_screen.dart';
import 'package:serenitys/ui/pages/search_screen.dart';
import 'package:serenitys/ui/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: kPrimaryColor,
          onPrimary: Colors.black,
          secondary: kWhiteColor,
        ),
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/home-page': (context) => const HomeScreen(),
        '/detail-page': (context) => const DetailScreen(),
        '/search-page': (context) => const SearchScreen()
      },
    );
  }
}
