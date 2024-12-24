import 'package:flutter/material.dart';

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
                  "https://scontent.fdac22-1.fna.fbcdn.net/v/t39.30808-6/470178434_2354847901530287_7108957599990460582_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeGPiFyickHvauGfOmcBs4bPen3bWu0cGW56fdta7RwZbhb4h_FZ7I7MT_CLgAQktYquGf3QS-_iq4uU0EtiFE8X&_nc_ohc=GqOv6ZdorQAQ7kNvgHAkLOE&_nc_zt=23&_nc_ht=scontent.fdac22-1.fna&_nc_gid=AbnoeQTLsjzPF5dmpebR7da&oh=00_AYBeCy2V3OnEkE8sEGItGjIeNuIU4U4dKC8EyGpW7J_fFw&oe=67689CEF",
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
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.medical_information),
            title: Text("Shelter Information"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.health_and_safety),
            title: Text("Health & First Aid Tips"),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.report),
            title: Text("Incident Reporting"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.crisis_alert),
            title: Text("Disaster Alerts"),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(color: Colors.red,width: 20,height: 20,
              child: Center(
                child: Text('8',
                  style: TextStyle(color: Colors.white,fontSize: 12),
                ),
              ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text("Community Forum"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () => null,
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
