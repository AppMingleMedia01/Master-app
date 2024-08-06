import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_app/Dashboard/live_classes/live_classes_screen.dart';
import 'package:master_app/Dashboard/profile/profile_screen.dart';
import 'package:master_app/utility.dart'; // Ensure to include utility.dart for dashboardContainer widget

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    LiveClassesScreen(), // Include the Live Classes Screen directly
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Master', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/profile_image.png',
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(width: 10), // Add spacing between the icon and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ABCDIBD',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()),
                          );
                        },
                        child: Text(
                          'View profile',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset('assets/icons/online_test.png', width: 24, height: 24),
              title: Text('Online Test'),
              onTap: () {
                // Handle navigation to Online Test screen
              },
            ),
            ListTile(
              leading: Image.asset('assets/icons/test_results.png', width: 24, height: 24),
              title: Text('Test Results'),
              onTap: () {
                // Handle navigation to Test Results screen
              },
            ),
            ListTile(
              leading: Image.asset('assets/icons/homework_assistance.png', width: 24, height: 24),
              title: Text('Homework Assistance'),
              onTap: () {
                // Handle navigation to Homework Assistance screen
              },
            ),
            ListTile(
              leading: Image.asset('assets/icons/downloads.png', width: 24, height: 24),
              title: Text('Downloads'),
              onTap: () {
                // Handle navigation to Downloads screen
              },
            ),
            ListTile(
              leading: Image.asset('assets/icons/about.png', width: 24, height: 24),
              title: Text('About'),
              onTap: () {
                // Handle navigation to About screen
              },
            ),
            ListTile(
              leading: Image.asset('assets/icons/contact_us.png', width: 24, height: 24),
              title: Text('Contact Us'),
              onTap: () {
                // Handle navigation to Contact Us screen
              },
            ),
            ListTile(
              leading: Image.asset('assets/icons/terms_conditions.png', width: 24, height: 24),
              title: Text('Term & Conditions'),
              onTap: () {
                // Handle navigation to Term & Conditions screen
              },
            ),
            ListTile(
              leading: Image.asset('assets/icons/logout.png', width: 24, height: 24),
              title: Text('Log out'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            label: 'Live Classes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: height / 40),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Quick', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              dashboardContainer(width: width, colorCode: 0xFFE8F3FB, image: 'assets/icons/compass.png', name: 'Notes'),
              dashboardContainer(width: width, colorCode: 0xFFF2DDF8, image: 'assets/icons/atom.png', name: 'Online Test'),
            ],
          ),
          SizedBox(height: height / 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              dashboardContainer(width: width, colorCode: 0xFFFFEDE1, image: 'assets/icons/hometutor.png', name: 'Home Tutor'),
              dashboardContainer(width: width, colorCode: 0xFFE2F2E2, image: 'assets/icons/homework_icon.png', name: 'Home work'),
            ],
          ),
          SizedBox(height: height / 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              dashboardContainer(width: width, colorCode: 0xFFE8F3FB, image: 'assets/icons/compass.png', name: 'Exams'),
              dashboardContainer(width: width, colorCode: 0xFFF2DDF8, image: 'assets/icons/atom.png', name: 'Live classes'),
            ],
          ),
          SizedBox(height: height / 50),
          const Padding(
            padding: EdgeInsets.only(left: 22.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Explore', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(height: height / 50),
          Container(
            width: width / 1.1,
            height: height / 4,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width / 2.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Perfect Home Tutor',
                        style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Connect with expert tutors for personalized learning at home.',
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                      SizedBox(height: height / 40),
                      SizedBox(
                        width: width / 3,
                        child: ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                          onPressed: () {},
                          child: Text('Book Now', style: TextStyle(color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset('assets/icons/Professor-pana 1.png')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}


