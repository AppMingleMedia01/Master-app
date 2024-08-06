import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 255, 255, 0.29),
              Color.fromRGBO(255, 255, 255, 0.29),
              Color.fromRGBO(241, 120, 0, 0.29),
            ],
            stops: [-1.9729, -0.0285, 1.2073],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 60), // To compensate for the transparent app bar
            // Top profile header with icon and name
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.transparent, // Make the container transparent
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                  bottom: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  // Profile icon
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300], // Placeholder color
                    backgroundImage: AssetImage('assets/icons/profile_user.png'), // Use asset image
                  ),
                  SizedBox(width: 16),
                  // User name
                  Text(
                    'Aryan abadd',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Ensure text is visible
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Expanded container with top rounded corners for email, address, and phone
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32), // Maximum top corners rounding
                ),
                child: Container(
                  width: double.infinity,
                  color: Colors.white, // Background color to match the header
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the left and right sides
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16), // Space between the outer container and the first ProfileInfoCard
                        ProfileInfoCard(
                          icon: Icons.email,
                          label: 'Email',
                          value: 'abc@gmail.com',
                        ),
                        SizedBox(height: 10),
                        ProfileInfoCard(
                          icon: Icons.location_on,
                          label: 'Address',
                          value: 'Address',
                        ),
                        SizedBox(height: 10),
                        ProfileInfoCard(
                          icon: Icons.phone,
                          label: 'Phone',
                          value: '+91 XXXXXXXXXX',
                        ),
                        // Add more content here if needed
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ;
  }
}

class ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  ProfileInfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
