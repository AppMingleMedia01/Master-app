import 'package:flutter/material.dart';
import 'package:master_app/Dashboard/live_classes/live_classes_screen.dart';
import 'package:master_app/Dashboard/quick_section/Assignment_Screen.dart';
import 'package:master_app/Dashboard/quick_section/Choose_Career_Screen.dart';
import 'package:master_app/Dashboard/quick_section/Exam_Notes_Screen.dart';
import 'package:master_app/Dashboard/quick_section/Govt_Council_Screen.dart';
import 'package:master_app/Dashboard/quick_section/HomeTutor_Screen.dart';
import 'package:master_app/Dashboard/quick_section/Homework_Screen.dart';
import 'package:master_app/Dashboard/quick_section/Online_Test_Screen.dart';
import 'package:master_app/Dashboard/quick_section/Subjective_Exams_Screen.dart';
import 'package:master_app/Dashboard/quick_section/Video_Classes_Screen.dart';
import 'package:master_app/my_helpers/my_alerts/alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:master_app/Dashboard/profile/profile_screen.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  int _selectedIndex = 0;
  bool _showHowToUse = false;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    LiveClassesScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('first_launch') ?? true;

    if (isFirstLaunch) {
      setState(() {
        _showHowToUse = true;
      });
      prefs.setBool('first_launch', false);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectProfileScreen() {
    setState(() {
      _selectedIndex = 3;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Master', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: <Widget>[
          if (_showHowToUse)
            TextButton(
              onPressed: () {
                setState(() {
                  _showHowToUse = false;
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17800),
                ),
              ),
              child: Text('How to use\nthe App?'),
            ),
        ],
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
                  SizedBox(width: 10),
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
                        onTap: _selectProfileScreen,
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
            ),// Add your ListTiles here...
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
        selectedItemColor: Color(0xFFF17800),
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Explore', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: height / 50),
            _buildPromoSection(
              context,
              title: 'Perfect Home Tutor',
              description: 'Connect with expert tutors for personalized learning at home.',
              color: Colors.black,
              image: 'assets/icons/Professor-pana 1.png',
            ),
            SizedBox(height: height / 50),
            _buildPromoSection(
              context,
              title: 'Book An Appointment',
              description: 'Connect with expert tutors for personalized learning at home.',
              color: Color(0xFFF17800),
              image: 'assets/icons/Professor-pana 1.png',
            ),
            SizedBox(height: height / 40),
            SizedBox(height: height / 50),
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
                _buildButton(
                  context,
                  title: 'Exam Notes',
                  color: Color(0xFFE8F3FB),
                  image: 'assets/icons/compass.png',
                  screen: ExamNotesScreen(),
                ),
                _buildButton(
                  context,
                  title: 'Choose Career',
                  color: Color(0xFFF2DDF8),
                  image: 'assets/icons/atom.png',
                  screen: ChooseCareerScreen(),
                ),
              ],
            ),
            SizedBox(height: height / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(
                  context,
                  title: 'Online Test',
                  color: Color(0xFFFFEDE1),
                  image: 'assets/icons/hometutor.png',
                  screen: OnlineTestScreen(),
                ),
                _buildButton(
                  context,
                  title: 'Home Tutor',
                  color: Color(0xFFE2F2E2),
                  image: 'assets/icons/homework_icon.png',
                  screen: HometutorScreen(),
                ),
              ],
            ),
            SizedBox(height: height / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(
                  context,
                  title: 'Homework',
                  color: Color(0xFFE8F3FB),
                  image: 'assets/icons/compass.png',
                  screen: HomeworkScreen(),
                ),
                _buildButton(
                  context,
                  title: 'Subjective Exams',
                  color: Color(0xFFF2DDF8),
                  image: 'assets/icons/atom.png',
                  screen: SubjectiveExamsScreen(),
                ),
              ],
            ),
            SizedBox(height: height / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(
                  context,
                  title: 'Assignment',
                  color: Color(0xFFFFEDE1),
                  image: 'assets/icons/hometutor.png',
                  screen: AssignmentScreen(),
                ),
                _buildButton(
                  context,
                  title: 'Live Classes',
                  color: Color(0xFFE2F2E2),
                  image: 'assets/icons/homework_icon.png',
                  screen: LiveClassesScreen(),
                ),
              ],
            ),
            SizedBox(height: height / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(
                  context,
                  title: 'Video Classes',
                  color: Color(0xFFE8F3FB),
                  image: 'assets/icons/compass.png',
                  screen: VideoClassesScreen(),
                ),
                _buildButton(
                  context,
                  title: 'Govt. Appended\nCouncils',
                  color: Color(0xFFF2DDF8),
                  image: 'assets/icons/atom.png',
                  screen: GovtCouncilScreen(),
                ),
              ],
            ),
            SizedBox(height: height / 50),

          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required String title, required Color color, required String image, required Widget screen}) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(MediaQuery.of(context).size.width / 2.3, MediaQuery.of(context).size.height / 6),
        padding: EdgeInsets.all(8.0),
        textStyle: TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 40, height: 40),
          SizedBox(height: 8.0),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildPromoSection(BuildContext context, {required String title, required String description, required Color color, required String image}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(image, width: 80, height: 80),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      description,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                // Handle book now action
                showSnackBar(context, 'Book Now Clicked');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Customize the color
              ),
              child: Text('Book Now'),
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
