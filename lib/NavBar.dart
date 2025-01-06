import 'package:flutter/material.dart';
import 'package:uddhar_app/CommunityPage.dart';
import 'package:uddhar_app/EmergencyContactsPage.dart';
import 'package:uddhar_app/SettingsPage.dart';
import 'package:uddhar_app/Incident.dart';
import 'package:uddhar_app/ShelterInfo.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Shams Ul Arefin Nibir",
              style: TextStyle(fontWeight: FontWeight.bold), // Bold text
            ),
            accountEmail: const Text(
              "sanibir1977@gmail.com",
              style: TextStyle(fontWeight: FontWeight.bold), // Bold text
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://media.licdn.com/dms/image/v2/D4E03AQFLFqRYXU6HWA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1720145880962?e=1741219200&v=beta&t=jqXuSz7g75IJaA5P38Z4AHrX6R9m2EmHX-7AUB_rAyk",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                image: NetworkImage(
                  "https://img.freepik.com/free-vector/gradient-monochromatic-abstract-background_52683-74300.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.contact_emergency),
            title: Text("Emergency Contacts"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmergencyContactsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.medical_information),
            title: Text("Shelter Information"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShelterPage(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.report),
            title: Text("Incident Reporting"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IncidentReportingPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text("Community Forum"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommunityForumPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
          SizedBox(height: 120,),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
