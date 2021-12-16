import 'dart:math';
import 'dart:typed_data';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:arcore_plugin/arcore_plugin.dart' as arcorePlugin;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter/services.dart' show ByteData, rootBundle;


class HelloWorld extends StatefulWidget {
  @override
  _HelloWorldState createState() => _HelloWorldState();

}

class _HelloWorldState extends State<HelloWorld> {
  ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    var lat2 = 33.565395126281544 ;
    var lon2 = 73.15265268640042;

    var image = 'assets/images/HotNSpicy.png';
    _addPlace(arCoreController, lat2, lon2, image);

    var lat3 = 33.65199596767686;
    var lon3 = 73.15652892426193;

    var image1 = 'assets/images/Comsats.png';
    _addPlace(arCoreController, lat3, lon3, image1);

    var lat4 = 33.565771554741886;
    var lon4 = 73.15292716237019;
    var image2 = 'assets/images/Meezan.png';
    _addPlace(arCoreController, lat4, lon4, image2);

    var lat5 = 33.56574002283081;
    var lon5 = 73.15661436934296;
    var image3 = 'assets/images/Punjab.png';
    _addPlace(arCoreController, lat5, lon5, image3);
  }

  Future<void> _addPlace(ArCoreController controller, lat2, lon2, places) async {

    ByteData byteData = await rootBundle.load(places);
    Uint8List bytes = byteData.buffer.asUint8List();

    final image = ArCoreImage(bytes: bytes,height: 80,width: 250);


    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);



    var lat1 = position.latitude;
    var lon1 = position.longitude;

    var R = 6371e3; // metres
    var a = lat1 * pi/180; // φ, λ in radians
    var b = lat2 * pi/180;
    var c = (lat2-lat1) * pi/180;
    var d = (lon2-lon1) * pi/180;

    var e = sin(c/2) * sin(c/2) +
    cos(a) * cos(b) *
    sin(d/2) * sin(d/2);
    var f = 2 * atan2(sqrt(a), sqrt(1-a));

    var distance = R * c; // in metres

    var y = sin(lon2) * cos(lat2);
    var x = cos(lat1)*sin(lat2) -
        sin(lat1)*cos(lat2)*cos(lon2);

    final node = ArCoreNode(
      image:image,
      position: vector.Vector3(x, y, distance),
    );

    controller.addArCoreNode(node);
  }


  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
