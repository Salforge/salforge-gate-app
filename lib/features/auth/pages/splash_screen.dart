
import 'dart:async';
import 'package:flutter/material.dart';

import '../pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _logoOpacity = 1.0;
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _logoOpacity,
              duration: Duration(seconds: 3),
              curve: Curves.easeInOut,
              child: Image.asset(
                'assets/images/logo.png',
                height: 170,
              ),
            ),
            SizedBox(height: 50), //Initial 20
            Text(
              'Gate Manager',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 250), // ⬅️ Increased spacing to push Powered by down
            Text(
              'Powered by',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 2), // ⬅️ Reduced spacing between text and logo
            Image.asset(
              'assets/images/salforge_logo.png',
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0), // ⬅️ Adjust as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedOpacity(
                opacity: _logoOpacity,
                duration: const Duration(seconds: 3),
                curve: Curves.easeInOut,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Gate Manager',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Powered by ',
                    style: TextStyle(
                      fontFamily: 'Helvetica',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Image.asset(
                    'assets/images/salforge_logo.png',
                    height: 28,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

}



/*
import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the fade-in animation after a short delay
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _logoOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Vertical centering
          children: [
            AnimatedOpacity(
              opacity: _logoOpacity,
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: Image.asset(
                'assets/logo.png',
                height: 170,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Gate Manager',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 120),
            Text(
              'Powered by',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Image.asset(
              'assets/salforge_logo.png',
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}

 */


/*

import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (_) => LoginScreen()),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 80), // Moves main content a bit up
          Column(
            children: [
              Image.asset(
                'assets/logo.png',
                height: 170, // Increased height
              ),
              SizedBox(height: 20),
              Text(
                'Gate Manager',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 32, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text(
                'Powered by',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 16, // Slightly increased
                ),
              ),
              SizedBox(height: 10),
              Image.asset(
                'assets/salforge_logo.png',
                height: 45, // Bigger logo
              ),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
*/

/*

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Spacer(flex: 2),
          Column(
            children: [
              Image.asset(
                'assets/logo.png',
                height: 150, // ⬆️ Increased height
              ),
              SizedBox(height: 24),
              Text(
                'Gate Manager',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 30, // ⬆️ Bigger text
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(flex: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Powered by ',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 14,
                ),
              ),
              Image.asset(
                'assets/salforge_logo.png',
                height: 25,
              ),
            ],
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
  */