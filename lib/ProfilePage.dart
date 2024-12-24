import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  final String name = "Shams Ul Arefin Nibir";
  final String email = "sanibir1977@gmail.com";
  final String address = "Kushtia, Khulna, Bangladesh";
  final String contact = "019*******5";
  final String profileImageUrl =
      "https://scontent.fdac22-1.fna.fbcdn.net/v/t39.30808-6/470178434_2354847901530287_7108957599990460582_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeGPiFyickHvauGfOmcBs4bPen3bWu0cGW56fdta7RwZbhb4h_FZ7I7MT_CLgAQktYquGf3QS-_iq4uU0EtiFE8X&_nc_ohc=GqOv6ZdorQAQ7kNvgHAkLOE&_nc_zt=23&_nc_ht=scontent.fdac22-1.fna&_nc_gid=AbnoeQTLsjzPF5dmpebR7da&oh=00_AYBeCy2V3OnEkE8sEGItGjIeNuIU4U4dKC8EyGpW7J_fFw&oe=67689CEF";
  final String coverImageUrl =
      "https://img.freepik.com/free-vector/gradient-monochromatic-abstract-background_52683-74300.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Stack for cover photo and profile picture
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Cover photo
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(coverImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Profile picture (overlapping)
              Positioned(
                bottom: -50,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(profileImageUrl),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          // Add spacing below the overlapping profile picture
          SizedBox(height: 60),
          // Profile details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  contact,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

