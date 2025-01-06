import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  final String name = "Shams Ul Arefin Nibir";
  final String email = "sanibir1977@gmail.com";
  final String address = "Kushtia, Khulna, Bangladesh";
  final String contact = "019*******5";
  final String profileImageUrl =
      "https://scontent.fdac22-2.fna.fbcdn.net/v/t39.30808-6/470157621_2355513364797074_3375079922506928982_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGyPRLIERbEJAuORamo1-X8JfYywArPfa8l9jLACs99rwoMplwxHE9t4Tzw15bdKK0Swx8zr8N_PDom8_NTWerk&_nc_ohc=V5B7YzDqrZ8Q7kNvgHC6Dgp&_nc_zt=23&_nc_ht=scontent.fdac22-2.fna&_nc_gid=AAgh7AP1wZQVtyS3q-TCV-K&oh=00_AYAyHlW-dTOOaZZZ6DZysO6WkubvGZqbKaFQXx7BbD-Nyg&oe=67765B40";
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

