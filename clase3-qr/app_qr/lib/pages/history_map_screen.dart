import 'package:app_qr/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HistoryMapScreen extends StatelessWidget {
   
  const HistoryMapScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'geo');
  }
}