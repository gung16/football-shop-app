import 'package:flutter/material.dart';
import 'package:football_shop/screens/login.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Football Shop',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF38BDF8), // --accent
          scaffoldBackgroundColor: const Color(0xFF0F172A), // --bg
          cardColor: const Color(0xFF111827), // --card
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF38BDF8), // --accent
            secondary: Color(0xFF22D3EE), // --brand
            surface: Color(0xFF111827), // --card
            background: Color(0xFF0F172A), // --bg
            error: Color(0xFFEF4444), // --danger
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Color(0xFFE5E7EB), // --text
            onBackground: Color(0xFFE5E7EB), // --text
            onError: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF111827), // --card
            foregroundColor: Color(0xFFE5E7EB), // --text
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF38BDF8), // --accent
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color(0xFF111827), // --card
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF94A3B8)), // --muted
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF94A3B8)), // --muted
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF38BDF8)), // --accent
            ),
            labelStyle: const TextStyle(color: Color(0xFFE5E7EB)), // --text
            hintStyle: const TextStyle(color: Color(0xFF94A3B8)), // --muted
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Color(0xFFE5E7EB)), // --text
            bodyMedium: TextStyle(color: Color(0xFFE5E7EB)), // --text
            titleLarge: TextStyle(color: Color(0xFFE5E7EB)), // --text
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}


