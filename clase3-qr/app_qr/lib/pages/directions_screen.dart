import 'package:app_qr/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DirectionsScreen extends StatelessWidget {
   
  const DirectionsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return ScanTiles(tipo: 'http');
  }
}