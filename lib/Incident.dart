import 'package:flutter/material.dart';

class IncidentReportingPage extends StatefulWidget {
  @override
  _IncidentReportingPageState createState() => _IncidentReportingPageState();
}

class _IncidentReportingPageState extends State<IncidentReportingPage> {
  String? incidentType;
  double severityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report an Incident', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Incident Title
            TextField(
              decoration: InputDecoration(
                labelText: 'Incident Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Incident Description
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 16),

            // Incident Type Dropdown
            DropdownButtonFormField<String>(
              value: incidentType,
              items: [
                DropdownMenuItem(child: Text('Natural Disaster'), value: 'Natural Disaster'),
                DropdownMenuItem(child: Text('Fire Accident'), value: 'Fire Accident'),
                DropdownMenuItem(child: Text('Crime Report'), value: 'Crime Report'),
              ],
              onChanged: (value) {
                setState(() {
                  incidentType = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Incident Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Severity Slider
            Text('Severity Level'),
            Slider(
              value: severityLevel,
              min: 1.0,
              max: 5.0,
              divisions: 4,
              label: severityLevel.toString(),
              onChanged: (value) {
                setState(() {
                  severityLevel = value;
                });
              },
            ),
            SizedBox(height: 16),

            // Location Input
            TextField(
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Upload Media Button
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement file picker
              },
              icon: Icon(Icons.camera_alt),
              label: Text('Upload Photo/Video'),
            ),
            SizedBox(height: 16),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement form submission logic
                },
                child: Text('Submit Report'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
