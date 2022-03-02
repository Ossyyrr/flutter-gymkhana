import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanqr/pages/create_page.dart';
import 'package:scanqr/pages/home_page.dart';
import 'package:scanqr/pages/mapa_page.dart';
import 'package:scanqr/pages/my_qr_page.dart';
import 'package:scanqr/providers/scan_list_provider.dart';
import 'package:scanqr/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
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
          'my_qr': (context) => const MyQRPage(),
          'create': (context) => const CreatePage(),
        },
      ),
    );
  }
}
