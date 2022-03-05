// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, prefer_collection_literals

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Utils/Colors.dart';
import '../../Utils/res.dart';

class Search extends StatefulWidget {
  const Search(
      {Key? key,
      menuScreenContext,
      bool? hideStatus,
      Null Function()? onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Set<Marker> _marker = Set<Marker>();

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Search Nearby Rental Shops",
                    style: GoogleFonts.roboto(
                        // fontFamily: 'Gilroy',
                        color: MyAppColors.blackcolor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20)),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              height: 590,
              width: double.infinity,
              //   color: Colors.red,
              child: GoogleMap(
                zoomControlsEnabled: true,
                myLocationButtonEnabled: true,
                zoomGesturesEnabled: true,

                myLocationEnabled: true,

                //   markers: ,
                mapType: MapType.normal,
                markers: _marker,
                initialCameraPosition: _kGooglePlex,
                //   initialCameraPosition: _initialCameraPosition,
                // initialCameraPosition: CameraPosition(
                //   zoom: 4,
                //   target: LatLng(widget.latitude, widget.longititude),
                // ),
                //  markers: ,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              // floatingActionButton: FloatingActionButton.extended(
              //   onPressed: _goToTheLake,
              //   label: Text('To the lake!'),
              //   icon: Icon(Icons.directions_boat),
              // ),
            ),
          )
      ],
    ),
        ));
  }
}
