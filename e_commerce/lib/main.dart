import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

import 'package:e_commerce/features/auth/auth_view/auth_wapper.dart';
import 'package:e_commerce/features/cart/model/hive_cart_item.dart';
import 'package:e_commerce/features/cart/viewmodel/cart_view_model_provider.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.deepPurple,
    secondary: Colors.amber,
    surface: Colors.grey[50]!,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
  appBarTheme: AppBarTheme(elevation: 0),
  cardTheme: CardTheme(
    elevation: 3.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    color: Colors.grey[100],
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(HiveCartItemAdapter());

  final cartBox = await Hive.openBox<HiveCartItem>('cartBox');

  runApp(
    ProviderScope(
      overrides: [cartBoxProvider.overrideWithValue(cartBox)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-commerce',
      debugShowCheckedModeBanner: false,
      theme: theme,
      themeMode: ThemeMode.system,
      home: const AuthWrapper(),
    );
  }
}
