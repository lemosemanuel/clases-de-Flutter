import 'dart:async';

import 'package:app_qr/models/scan_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaScreen extends StatefulWidget {
   
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType= MapType.normal;
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
    target: scan.gettLatLng(),
    zoom: 17,
  );

  // marcadores
  Set<Marker>markers=new Set<Marker>();
  markers.add(new Marker(
    markerId: MarkerId('geo-location'),
    position: scan.gettLatLng(),
  ));


    // leo lo que mando por los argumentos del Navigator.pushName 
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            onPressed: ()async{
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.gettLatLng(),
                    zoom: 17,
                    tilt:50
                  )
                ),
              );
            }, 
            icon: Icon(Icons.location_history))
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: (){
          if(mapType== MapType.normal){
            mapType=MapType.satellite;
          }else{
            mapType=MapType.normal;
          }
          setState(() {
            
          });
        },
      ),
    );
  }
}