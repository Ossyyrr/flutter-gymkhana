import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanqr/pages/direcciones_page.dart';
import 'package:scanqr/pages/mapas_page.dart';
import 'package:scanqr/pages/widgets/custom_appBar.dart';
import 'package:scanqr/pages/widgets/custom_navigatorBar.dart';
import 'package:scanqr/pages/widgets/scan_button.dart';
import 'package:scanqr/providers/scan_list_provider.dart';
import 'package:scanqr/providers/ui_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // here the desired height
        child: CustomAppBar(),
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    // PRUEBAS ---------------
    //final tempScan = ScannModel(valor: 'http://google.com');
    //DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.getScanById(16);
    //DBProvider.db.getTodosLosScans().then((value) => print(value));
    //DBProvider.db.deleteAllScans();
    // --------------------

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScans();
        return const MapasPage();
      case 1:
      default:
        scanListProvider.cargarScans();

        return const DireccioensPage();
    }
  }
}
