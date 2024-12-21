import 'package:flutter/material.dart';

// Constants
const double _iconSize = 30;
const double _iconSizeSmall = 12;
const Color _backgroundColor = Colors.black;
const Color _bottomNavBackgroundColor = Color(0xFF3d3d3d);
const Color _selectedItemColor = Color(0xFFA858F4);
const Color _unselectedItemColor = Colors.white;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const BottomNavigationExample(),
    );
  }
}

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({super.key});

  @override
  _BottomNavigationExampleState createState() => _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigationExample> {
  int _currentIndex = 0;
  String currentAction = 'Video'; // Tracks the current action: 'Video' or 'Reply'

  final List<Widget> _pages = const [
    HomeScreen(),
    DiscoverScreen(),
    VideoScreen(),
    ReplyScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onTabTapped, // Handle tab tapping
        backgroundColor: _bottomNavBackgroundColor,
        selectedItemColor: _selectedItemColor,
        unselectedItemColor: _unselectedItemColor,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: _buildTextButton('Video', Icons.videocam, currentAction == 'Video'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildTextButton('Reply', Icons.reply, currentAction == 'Reply'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildTextButton(String label, IconData icon, bool isSelected) {
    return TextButton(
      onPressed: () {
        setState(() {
          currentAction = label; // Update current action
        });
      },
      style: TextButton.styleFrom(),
      child: Text(
        label,
        style: TextStyle(
          fontSize: _iconSizeSmall,
          color: isSelected ? _selectedItemColor : _unselectedItemColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: _selectedItemColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          currentAction == 'Video' ? Icons.videocam : Icons.reply,
          color: Colors.white,
          size: _iconSize,
        ),
        onPressed: (){
          setState(() {
            if (currentAction == 'Video') {
              _currentIndex = 2; // Navigate to ReplyScreen
            } else {
              _currentIndex = 3; // Navigate to VideoScreen
            }
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Screen',
        style: TextStyle(fontSize: _iconSize),
      ),
    );
  }
}

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Discover Screen',
        style: TextStyle(fontSize: _iconSize),
      ),
    );
  }
}

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Video Screen',
        style: TextStyle(fontSize: _iconSize),
      ),
    );
  }
}

class ReplyScreen extends StatelessWidget {
  const ReplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Reply Screen',
        style: TextStyle(fontSize: _iconSize),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Notifications Screen',
        style: TextStyle(fontSize: _iconSize),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(fontSize: _iconSize),
      ),
    );
  }
}
