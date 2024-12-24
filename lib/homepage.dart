import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'NavBar.dart';
import 'ProfilePage.dart';
import 'EmergencyContactsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String? selectedAlert;

  // Emergency Categories
  List<String> _categories = [
    'Disaster Alerts',
    'Safety Tips',
    'Resources',
    'Reports',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text(
          'Uddhar App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            _buildCategorySelector(),
            const SizedBox(height: 20),
            _buildCategoryContent(),
            const SizedBox(height: 20),
            _buildQuickActions(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySelector() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                selectedAlert = null;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Colors.green
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _categories[index],
                style: TextStyle(
                  color: selectedIndex == index
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryContent() {
    if (selectedIndex == 0) {
      return selectedAlert == null
          ? _buildDisasterAlertContent()
          : _buildAlertDetailsContent(selectedAlert!);
    } else if (selectedIndex == 1) {
      return _buildSafetyTipsContent();
    } else if (selectedIndex == 2) {
      return _buildResourcesContent();
    } else {
      return _buildReportsContent();
    }
  }

  Widget _buildQuickActions() {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        _buildQuickAction(
          icon: Icons.book,
          label: 'Incident Reporting',
          onTap: () {},
        ),
        _buildQuickAction(
          icon: Icons.phone,
          label: 'Emergency Contacts',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmergencyContactsPage(),
              ),
            );
          },
        ),
        _buildQuickAction(icon: Icons.map, label: 'Shelter Information', onTap: () {}),
        _buildQuickAction(icon: Icons.payment, label: 'Donate Us', onTap: () {}),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.greenAccent,
      color: Colors.green,
      animationDuration: const Duration(milliseconds: 300),
      items: const [
        Icon(Icons.info, color: Colors.white),
        Icon(Icons.home, color: Colors.white),
        Icon(Icons.person, color: Colors.white),
      ],
      onTap: (index) {
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        }
      },
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.green),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisasterAlertContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Disaster Alerts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildDisasterAlertItem('Flood Alert', 'Rising water levels in urban areas.'),
              _buildDisasterAlertItem('Fire Alert', 'Forest fire in the northern region.'),
              _buildDisasterAlertItem('Tsunami Alert', 'High waves approaching the coastal areas.'),
              _buildDisasterAlertItem('Cyclone Alert', 'Severe cyclone approaching landfall.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDisasterAlertItem(String title, String description) {
    return ListTile(
      leading: Icon(Icons.warning, color: Colors.green),
      title: Text(title),
      subtitle: Text(description),
      onTap: () {
        setState(() {
          selectedAlert = title;
        });
      },
    );
  }

  Widget _buildAlertDetailsContent(String alertTitle) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            alertTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Detailed information about $alertTitle will be displayed here.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                selectedAlert = null;
              });
            },
            child: const Text('Back to Alerts'),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyTipsContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health & First Aid Tips',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              ListTile(
                leading: Icon(Icons.health_and_safety, color: Colors.green),
                title: Text('Stay hydrated during emergencies.'),
              ),
              ListTile(
                leading: Icon(Icons.health_and_safety, color: Colors.green),
                title: Text('Carry a first aid kit with essential supplies.'),
              ),
              ListTile(
                leading: Icon(Icons.health_and_safety, color: Colors.green),
                title: Text('Learn basic CPR and first aid techniques.'),
              ),
              ListTile(
                leading: Icon(Icons.health_and_safety, color: Colors.green),
                title: Text('Avoid areas with potential hazards.'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResourcesContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resources',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('Resource details will be displayed here.'),
        ],
      ),
    );
  }

  Widget _buildReportsContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reports',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('Report details will be displayed here.'),
        ],
      ),
    );
  }
}

