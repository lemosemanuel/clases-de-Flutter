import 'package:app_qr/models/scan_model.dart';
import 'package:app_qr/pages/pages.dart';
import 'package:app_qr/providers/db_provider.dart';
import 'package:app_qr/providers/scan_list_provider.dart';
import 'package:app_qr/providers/ui_provider.dart';
import 'package:app_qr/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Wait !'),
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<ScanListProvider>(context,listen: false).borrarTodos();
            },

            icon: const Icon(Icons.delete))
        ],
        ),
      body: const _HomePageBody(),
    bottomNavigationBar: const CustomNavigatorBar(),
    floatingActionButton: const ScanButton(),
    // centro el floatingActionButton
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // busco el Provider del uiProvider
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex=uiProvider.selectedMenuOption;

    // Todo Temporal leer la base de datos
    final tempScan= new ScanModel(valor: 'http:google.com');
    // DBProvider.db.getScanById(1).then((value) => print(value.valor));
    // DBProvider.db.getTodosLosScans().then(print);

    // Usar el ScanListProvider
    final scanListProvider=Provider.of<ScanListProvider>(context,listen: false);
    
    switch(currentIndex){
      case 0: 
      scanListProvider.CargarScanPorTipo('geo');
        return HistoryMapScreen();
      case 1:
      scanListProvider.CargarScanPorTipo('http');
        return DirectionsScreen();
      default:
        return DirectionsScreen();
    }

  }
}