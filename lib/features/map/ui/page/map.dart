import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dating_cdcnpm/routes/route_name.dart';
import 'package:flutter_dating_cdcnpm/style/styleAppBar.dart';
import 'package:flutter_dating_cdcnpm/theme/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // var _scaffoldKey = new GlobalKey<ScaffoldState>();
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     key: _scaffoldKey,
  //     appBar: StyleAppBar(
  //       backgroundColor: kBackgroudColor,
  //       elevation: 0.0,
  //       height: 60,
  //       leading: InkWell(
  //         onTap: () {},
  //         child: Container(
  //           margin: EdgeInsetsDirectional.only(start: 5),
  //           child: ShaderMask(
  //               child: Icon(
  //                 FontAwesomeIcons.heartBroken,
  //                 size: 42,
  //                 color: Colors.redAccent,
  //               ),
  //               blendMode: BlendMode.srcATop,
  //               shaderCallback: (bounds) {
  //                 return LinearGradient(
  //                         colors: [
  //                       Colors.redAccent,
  //                       Colors.deepPurpleAccent,
  //                     ],
  //                         begin: Alignment.bottomCenter,
  //                         end: Alignment.topCenter,
  //                         tileMode: TileMode.repeated)
  //                     .createShader(bounds);
  //               }),
  //         ),
  //       ),
  //       title: GradientText(
  //         text: 'Map',
  //         colors: <Color>[Colors.redAccent, Colors.purpleAccent],
  //         style: TextStyle(fontSize: 30.0),
  //       ),
  //       actions: [
  //         IconButton(
  //             icon: Icon(Icons.settings),
  //             color: Colors.grey,
  //             onPressed: () {
  //               Navigator.pushNamed(context, RouteName.settingPage);
  //             })
  //       ],
  //     ),
  //     body: Container(
  //       constraints: BoxConstraints.expand(),
  //       color: Colors.white,
  //       child: Stack(
  //         children: <Widget>[
  //           GoogleMap(
  //             initialCameraPosition: CameraPosition(
  //               target: LatLng(10.8457767, 106.7936149),
  //               zoom: 14.4746,
  //             ),
  //             scrollGesturesEnabled: true,
  //             tiltGesturesEnabled: true,
  //             rotateGesturesEnabled: true,
  //             myLocationEnabled: true,
  //             compassEnabled: true,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  GoogleMapController? _mapController;

  LatLng _center = const LatLng(10.779785, 106.699020);

  final Location _location = Location();

  MapType _currentMapType = MapType.normal;
  final Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _location.onLocationChanged.listen((event) {
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.latitude!, event.longitude!), zoom: 11),
        ),
      );
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_center.toString()),
        position: _center,
        // infoWindow:
        //     InfoWindow(title: 'Nice Place', snippet: 'Welcome to Poland'),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _center = position.target;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyleAppBar(
        backgroundColor: kBackgroudColor,
        elevation: 0.0,
        height: 60,
        leading: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 5),
            child: ShaderMask(
                child: Icon(
                  FontAwesomeIcons.heartBroken,
                  size: 42,
                  color: Colors.redAccent,
                ),
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) {
                  return LinearGradient(
                          colors: [
                        Colors.redAccent,
                        Colors.deepPurpleAccent,
                      ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          tileMode: TileMode.repeated)
                      .createShader(bounds);
                }),
          ),
        ),
        title: GradientText(
          text: 'Map',
          colors: <Color>[Colors.redAccent, Colors.purpleAccent],
          style: TextStyle(fontSize: 30.0),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              color: Colors.grey,
              onPressed: () {
                Navigator.pushNamed(context, RouteName.settingPage);
              })
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: _currentMapType,
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: _markers,
            onCameraMove: _onCameraMove,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: _onAddMarkerButtonPressed,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.green,
                child: const Icon(Icons.map, size: 30.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, right: 10.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                mini: true,
                onPressed: () => {_onMapTypeButtonPressed()},
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.white60,
                child: Icon(
                  Icons.map_outlined,
                  // size: ScreenUtil().setWidth(20),
                  color: Colors.black87.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
}
