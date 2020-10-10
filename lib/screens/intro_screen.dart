import 'package:flutter/material.dart';
import 'package:flutter_intro_screen/helper/images.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _selectedIndex = 0;

  final List<String> images = [
    KImages.car1,
    KImages.car2,
    KImages.car3,
    KImages.car4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) => Image.asset(
                  images[index],
                  fit: BoxFit.fitHeight,
                ),
                onPageChanged: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 100,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: images
                    .asMap()
                    .entries
                    .map(
                      (e) => _buildDot(e.key),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 40,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _selectedIndex == images.length - 1
                    ? Colors.white
                    : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                  color: _selectedIndex == images.length - 1
                      ? Colors.orange
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return CircleAvatar(
      backgroundColor:
          _selectedIndex == index ? Colors.orangeAccent : Colors.white38,
      radius: 8.0,
    );
  }
}
