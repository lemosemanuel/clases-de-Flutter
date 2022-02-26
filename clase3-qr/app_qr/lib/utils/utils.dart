import 'package:url_launcher/url_launcher.dart';
import 'package:app_qr/models/scan_model.dart';
import 'package:flutter/material.dart';

launchURL(BuildContext context,ScanModel scan) async {
  final url= scan.valor;

  if  (scan.tipo =='http'){
    if (!await launch(url)) throw 'Could not launch $url';
  }else{
    Navigator.pushNamed(context, 'mapa',arguments: scan);
  }
}