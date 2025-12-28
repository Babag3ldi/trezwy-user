import 'package:flutter/material.dart';
import 'features/splash/presentation/screens/splash_screen.dart';

class TrezwyUserApp extends StatelessWidget {
  const TrezwyUserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trezwyý User',
      debugShowCheckedModeBanner: false, // "Debug" ýazgysyny aýyrmak

      // --- TEMA SAZLAMALARY (THEME) ---
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark, // Garaňky tema (Tekstler awtomatiki ak bolýar)
        
        // Esasy Fon Reňki
        scaffoldBackgroundColor: const Color(0xFF000023), 
        
        // Reňk Palitrasy
        colorScheme: const ColorScheme.dark(
          primary: Colors.indigoAccent,   // Esasy düwmeler, aktiw elementler
          secondary: Colors.cyanAccent,   // Ikinji derejeli owadanlyklar
          surface: Color(0xFF1A1A40),  // Arka fon
          error: Colors.redAccent,        // Ýalňyşlyklar
        ),

        // Font (Google Fonts ulanyp bilersiňiz, häzirlikçe standart)
        fontFamily: 'Roboto', 

        // AppBar (Kellejik) Temasy
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        // ElevatedButton (Düwme) Temasy
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigoAccent,
            foregroundColor: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),

        // Input (Yazgy meýdançasy) Temasy
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.08),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.indigoAccent),
          ),
        ),
      ),

      // --- SAHYPALAR ---
      home: const SplashScreen(),
    );
  }
}