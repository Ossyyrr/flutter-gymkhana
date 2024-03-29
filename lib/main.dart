import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanqr/pages/create_page.dart';
import 'package:scanqr/pages/home_page.dart';
import 'package:scanqr/pages/mapa_page.dart';
import 'package:scanqr/providers/create_qr_provider.dart';
import 'package:scanqr/providers/scan_list_provider.dart';
import 'package:scanqr/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
        ChangeNotifierProvider(create: (_) => CreateQRProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        theme: ThemeData(
          primaryColor: Colors.amber,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
          iconTheme: const IconThemeData(color: Colors.amber),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(selectedItemColor: Colors.amber),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.amber,
          ),
        ),
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomePage(),
          'mapa': (context) => const MapPage(),
          'create': (context) => const CreatePage(),
        },
      ),
    );
  }
}
