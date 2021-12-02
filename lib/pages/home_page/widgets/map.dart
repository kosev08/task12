import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;

import '../../../constants.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool loaded = false;
  String urlTemplate = 'https://{s}.maps.2gis.com/tiles?x={x}&y={y}&z={z}';
  var subdomains = ['tile0', 'tile1', 'tile2', 'tile3'];
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.67,
      child: FlutterMap(
        options: MapOptions(
          center: latlng.LatLng(43.222015, 76.851250),
          zoom: 12.5,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: urlTemplate,
            subdomains: subdomains,
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                  rotate: true,
                  width: 20,
                  height: 20,
                  point: latlng.LatLng(43.222015, 76.851250),
                  builder: (ctx) => Icon(
                        Icons.person,
                        color: Color(0xff47536D),
                      )),
              Marker(
                width: 80.0,
                height: 80.0,
                point: latlng.LatLng(43.303313, 76.875570),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.person_sharp,
                    color: Color(0xff47536D),
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: latlng.LatLng(43.292827, 76.864050),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.person_sharp,
                    color: Color(0xff47536D),
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: latlng.LatLng(43.293754, 76.914187),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.person_sharp,
                    color: Color(0xff47536D),
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: latlng.LatLng(43.295073, 76.909762),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.person_sharp,
                    color: Color(0xff47536D),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
