import 'package:flutter/material.dart';
import 'package:salforge_gate_app/core/constants/assEsts.dart';

class DashboardScreen extends StatelessWidget {
  final String activeItem = 'Gate Control'; // Track the active item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Color(0xFF1B958A)),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Gate Control',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              Image.asset(
                GATE,
                height: 180,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1B958A),
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                ),
                child: Text(
                  'Open',
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1B958A),
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                ),
                child: Text(
                  'Close',
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Powered by ',
                    style: TextStyle(fontFamily: 'Helvetica', fontSize: 12),
                  ),
                  Image.asset(
                    'assets/images/salforge_logo.png', // Replace with your logo path
                    height: 18,
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      elevation: 16,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              // Avatar Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1B958A), Color(0xFF23C6A9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Color(0xFF1B958A), size: 30),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              // Drawer Items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 10),
                  children: [
                    _buildDrawerItem(context, Icons.person, 'User Management'),
                    _buildDrawerItem(context, Icons.shield_outlined, 'Gate Control'),
                    _buildDrawerItem(context, Icons.verified, 'Approvals'),
                    _buildDrawerItem(context, Icons.lock_outline, 'Change Password'),
                    _buildDrawerItem(context, Icons.logout, 'Logout'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Powered by Salforge',
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String label) {
    final bool isActive = label == activeItem;
    return Container(
      decoration: isActive
          ? BoxDecoration(
        color: Color(0xFF1B958A).withOpacity(0.1),
        border: Border(
          left: BorderSide(color: Color(0xFF1B958A), width: 4),
        ),
      )
          : null,
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF1B958A), size: 24),
        title: Text(
          label,
          style: TextStyle(
            fontFamily: 'Helvetica',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isActive ? Color(0xFF1B958A) : Colors.black,
          ),
        ),
        onTap: () {
          Navigator.pop(context); // Close drawer
          if (label == activeItem) {
            // Do nothing
          } else if (label == 'Logout') {
            // TODO: Add logout functionality
          } else {
            // Show "In Progress" dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Coming Soon'),
                content: Text('$label screen is under development.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK', style: TextStyle(color: Color(0xFF1B958A))),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

}



////////////////////////////////////////////////////////////////////////////////
/*
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 16,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(30),
          ),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                // Gradient header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1B958A), Color(0xFF23C6A9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Menu options
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    children: [
                      _buildDrawerItem(Icons.person, 'User Management'),
                      _buildDrawerItem(Icons.shield_outlined, 'Gate Control'),
                      _buildDrawerItem(Icons.verified, 'Approvals'),
                      _buildDrawerItem(Icons.lock_outline, 'Change Password'),
                      _buildDrawerItem(Icons.logout, 'Logout'),
                    ],
                  ),
                ),

                // Footer
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Powered by Salforge',
                    style: TextStyle(
                      fontFamily: 'Helvetica',
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Top Row
            Positioned(
              top: 20,
              left: 20,
              child: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Color(0xFF1B958A), size: 30),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Image.asset(
                'assets/images/logo.png',
                height: 50,
              ),
            ),

            // Main Content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 60),
                    const Text(
                      'Gate Control',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Image.asset(
                      'assets/icons/gate_icon.png', // Replace with your actual image
                      height: 150,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B958A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Open',
                        style: TextStyle(fontFamily: 'Helvetica'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B958A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Close',
                        style: TextStyle(fontFamily: 'Helvetica'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Powered by ',
                    style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'Helvetica'),
                  ),
                  Image.asset(
                    'assets/images/salforge_logo.png',
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF1B958A), size: 24),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'Helvetica',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        // handle navigation
      },
    );
  }

}
*/

////////////////////////////////////////////////////////////////////////////////


/*
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF1B958A)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('User Management'),
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Gate Control'),
            ),
            ListTile(
              leading: Icon(Icons.check_circle),
              title: Text('Approvals'),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Top Row
            Positioned(
              top: 20,
              left: 20,
              child: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Color(0xFF1B958A), size: 32),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Image.asset(
                'assets/images/logo.png',
                height: 50,
              ),
            ),

            // Center Content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Gate Control',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Image.asset(
                      'assets/icons/gate_icon.png', // Replace with your gate image
                      height: 140,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B958A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text('Open'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B958A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Footer
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Powered by ',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Image.asset(
                    'assets/images/salforge_logo.png',
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'Welcome to Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Helvetica',
          ),
        ),
      ),
    );
  }
}

 */
