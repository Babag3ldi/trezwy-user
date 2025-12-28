import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'app.dart';
// Geljekde Providerleriňizi şu ýere import edersiňiz
// import 'features/auth/logic/auth_provider.dart';

void main() async {
  // 1. Flutter baglanyşyklaryny kepillendirmek
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Status Bar (Ýokarky zolak) sazlamalary (UX üçin wajyp)
  // Ekranyň ýokarsyny transparent edýäris, şonda gara fon ýokary çenli gidýär.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Arka fon görünmez
      statusBarIconBrightness: Brightness.light, // Ikonkalar ak reňkde
      systemNavigationBarColor: Color(0xFF000023), // Aşaky zolak gara-gök
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  // 3. Ekrany diňe dikligine (Portrait) gulplamak (Islege görä)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 4. Hyzmatlary işe girizmek (Hive we ş.m.)
  await Hive.initFlutter();
  // await Hive.openBox('user_settings'); // Gerek bolsa box açmaly

  // 5. Programmany başlatmak
  runApp(
    // MultiProvider(
    //   providers: [
    //     // Ähli global providerler şu ýerde bolar
    //     // ChangeNotifierProvider(create: (_) => AuthProvider()),
    //     // ChangeNotifierProvider(create: (_) => OrderProvider()),
    //   ],
    // child:
    const TrezwyUserApp(),
    // ),
  );
}
