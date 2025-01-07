import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShelterPage extends StatefulWidget {
  @override
  _ShelterPageState createState() => _ShelterPageState();
}

class _ShelterPageState extends State<ShelterPage> {
  late GoogleMapController mapController;

  // Define initial camera position for the map (for example, coordinates for the shelter)
  static const LatLng _shelterPosition = LatLng(23.8103, 90.4125);  // Example coordinates (Dhaka)

  // Set the initial camera position
  CameraPosition _initialPosition = CameraPosition(
    target: _shelterPosition,
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shelter Information'),
        backgroundColor: Colors.green,  // Set AppBar to Green
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Shelter Name
              Text(
                'Shelter Name: Hope Shelter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10),

              // Shelter Description
              Text(
                'Hope Shelter provides temporary housing and assistance to individuals and families facing homelessness. Our mission is to offer a safe place where people can rest and get the help they need to rebuild their lives.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),

              // Shelter Address Section
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Address:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '123 Shelter Lane, Dhaka, Bangladesh',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Google Map Section
              Container(
                height: 300,  // Set the height of the map
                child: GoogleMap(
                  initialCameraPosition: _initialPosition,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId('shelter'),
                      position: _shelterPosition,
                      infoWindow: InfoWindow(
                        title: 'Hope Shelter',
                        snippet: 'Temporary Housing and Support',
                      ),
                    ),
                  },
                ),
              ),
              SizedBox(height: 20),

              // Contact Information Section
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Contact Information:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Phone: +880123456789',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        'Email: info@hopeshelter.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Shelter Services Section
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Services Offered:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '- Temporary Housing\n- Food and Water\n- Counseling and Support\n- Job Placement Assistance',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Shelter Operating Hours
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Operating Hours:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Open 24/7 for emergency shelter and support.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

