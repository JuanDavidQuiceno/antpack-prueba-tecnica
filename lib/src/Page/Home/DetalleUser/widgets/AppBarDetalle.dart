import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prueba_tecnica/src/Models/Users-Model.dart';


class AppBarDetalle extends StatefulWidget {
  final UserModel user;
  AppBarDetalle({Key? key, required this.user}) : super(key: key);

  @override
  _AppBarDetalleState createState() => _AppBarDetalleState();
}

class _AppBarDetalleState extends State<AppBarDetalle> {

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _market = new Set<Marker>();

  late CameraPosition _puntoInicial;/*  = CameraPosition(
    target: LatLng(4.3580437,-73.9450831),
    zoom: 5,
  ); */

  @override
  void initState() {
    // print(widget.user.address!.toJson());
    _puntoInicial = CameraPosition(
      target: LatLng(widget.user.address!.geo!.lat!, widget.user.address!.geo!.lng!),
      zoom: 10,
    );
    _market.add(
      new Marker(
        markerId: MarkerId('${widget.user.id}'),
        position: LatLng(widget.user.address!.geo!.lat!, widget.user.address!.geo!.lng!)
      )
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.dark,
      backgroundColor: Colors.pink,
      expandedHeight: MediaQuery.of(context).size.height*0.4,
      stretchTriggerOffset: 100.0,
      stretch: true,
      onStretchTrigger: ()async{
        return;
      },
      floating: true,
      pinned: false,
      snap: true,
      leading: IconButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back, color: Colors.white,),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        stretchModes: [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
        background: GoogleMap(
          myLocationEnabled: true,
          markers: _market,
          mapType: MapType.normal,
          initialCameraPosition: _puntoInicial,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        )
        
        // title: SafeArea(
        //   child: Text(
        //     'Detalle Compra', 
        //     style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 20.0, ), 
        //     textAlign: TextAlign.center,
        //     // maxLines: 2, 
        //     overflow: TextOverflow.ellipsis,
        //   ),
        // ),
      ),
      
    );
  }
}