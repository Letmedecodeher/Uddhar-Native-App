import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShelterPage extends StatefulWidget {
  @override
  _ShelterPageState createState() => _ShelterPageState();
}

class _ShelterPageState extends State<ShelterPage> {
  late WebViewController _webViewController;

  final String address = "123 Shelter Lane, Dhaka, Bangladesh";

  @override
  void initState() {
    super.initState();
    // Ensure WebView is initialized before the widget is built
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shelter Information"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shelter Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Address:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  address,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "Contact Information:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Phone: +880123456789\nEmail: info@hopeshelter.com",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "Services Offered:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "- Temporary Housing\n- Food and Water\n- Emergency Assistance",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "Map:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: WebView(
              initialUrl: 'https://maps.gomaps.pro/maps/api/js?key=AlzaSy56-FNfsLQcqTdnFwMihYIkral1v7wlKLh&libraries=geometry,places&callback=initMap',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _webViewController = webViewController;
              },
            ),
          ),
        ],
      ),
    );
  }
}


