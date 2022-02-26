import 'package:app_qr/providers/scan_list_provider.dart';
import 'package:app_qr/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider=Provider.of<ScanListProvider>(context);
    
    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (_, i) =>Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direction) => scanListProvider.borrarScanPorId(scanListProvider.scans[i].id!.toInt()),
        child: ListTile(
          leading: Icon(
            this.tipo =='http'
            ? Icons.home_outlined
            : Icons.map_outlined
            ,color:Theme.of(context).primaryColor),
          title: Text(scanListProvider.scans[i].valor),
          subtitle: Text('ID ${scanListProvider.scans[i].id.toString()}'),
          trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
          onTap: () => launchURL(context, scanListProvider.scans[i]),
        ),
      ),
      
    );
  }
}