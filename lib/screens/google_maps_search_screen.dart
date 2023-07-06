import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import '../models/houseModel.dart';
import '../theme.dart';
import '../widgets/around_card.dart';

class GoogleMapsScreen extends StatefulWidget {
  @override
  GoogleMapsScreenState createState() => GoogleMapsScreenState();
}

class GoogleMapsScreenState extends State<GoogleMapsScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController _mapController;
  LocationData currentLocation = LocationData.fromMap({
    "latitude": 45.4642, // Milan latitude
    "longitude": 9.1900, // Milan longitude
  });
  List<DocumentSnapshot> _documents = [];

  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    // Initialize the Firestore instance
    FirebaseFirestore.instance.collection('Houses').get().then((snapshot) {
      setState(() {
        _documents = snapshot.docs;
      });
    });
    //_onCameraMove(CameraPosition(target: LatLng(currentLocation.latitude!, currentLocation.longitude!), zoom: 12));
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Check if location services are enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    // Check if location permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    // Retrieve the current device location

    location.onLocationChanged.listen((LocationData locationData) {
      setState(() {
        currentLocation = locationData;
      });
    });
    //LocationData locationData = await location.getLocation();
    //setState(() {
    //  currentLocation = locationData;
    //});
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //_arrowBack(context),
            _buildGoogleMap(context),
            //_zoomminusfunction(),
            //_zoomplusfunction(),
            //_buildContainer(),
          ],
        ),
      ),
    );
  }

  Widget _arrowBack(context) {
    return Positioned(
      top: 20,
      left: 20,
      child: MaterialButton(
        onPressed: () {
          Navigator.pop(context);
        },
        minWidth: 30,
        height: 30,
        padding: EdgeInsets.all(5),
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.arrow_back_ios_outlined,
          size: 14,
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  40.738380,
                  -73.988426,
                  "Gramercy Tavern"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  40.761421,
                  -73.981667,
                  "Le Bernardin"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  40.732128,
                  -73.999619,
                  "Blue Hill"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "4.1",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    //LatLng initialCameraPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
    // if (initialCameraPosition!=null)
    //  initialCameraPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);

    return Expanded(
        child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(
                    currentLocation.latitude!, currentLocation.longitude!),
                zoom: 12),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            //onCameraMove: _onCameraMove,
            markers:
                _buildMarkers()
            ));
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }

  void _showDetailsModal(BuildContext context, House house) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
            heightFactor: 0.30,
            child:  Column(
                children: [
                  SizedBox(height: 10,),
                  Container(
                    height: 5, // Adjust the height according to your needs
                    width: 150, // Set the width to match the parent container or specify a fixed width
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  SizedBox(height: 15,),
                  PreviewCard(
                  house: house,
                ),]
              ),
        );
      },
    );
  }

  Future<void> _onCameraMove(CameraPosition position) async {
    // Retrieve the visible bounds of the map
    GoogleMapController controller = await _controller.future;
    LatLngBounds visibleBounds = await controller.getVisibleRegion();

    // Perform a query to fetch documents within the visible bounds
    // You need to replace 'your_collection' and 'location_field' with your actual collection and field names
    _firestore
        .collection('House')
        .where('posizione',
            isGreaterThanOrEqualTo: visibleBounds.southwest,
            isLessThanOrEqualTo: visibleBounds.northeast)
        .get()
        .then((snapshot) {
      setState(() {
        _documents = snapshot.docs;
      });
    });
  }

  Set<Marker> _buildMarkers() {
    return _documents.map((document) {
      // Extract the geoposition from the document
      GeoPoint geoPoint = document.get('posizione') as GeoPoint;
      LatLng position = LatLng(geoPoint.latitude, geoPoint.longitude);
      // Create a marker for each document
      Map<String, dynamic> data = document.data() as Map<String,dynamic>;
      return Marker(
        markerId: MarkerId(document.id),
        position: position,
        infoWindow: InfoWindow(title: document.get('titolo')),
        onTap: () => _showDetailsModal(context, House.fromJson(data)),
      );
    }).toSet();
  }

}
