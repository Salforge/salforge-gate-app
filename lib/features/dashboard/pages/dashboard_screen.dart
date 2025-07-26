import 'package:flutter/material.dart';
import 'package:salforge_gate_app/core/constants/assets.dart';

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
              LOGO, //Diamond's Edge Logo
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
                    SLOGO, // Salforge Logo
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

