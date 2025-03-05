import 'package:coin/Homescreen.dart';
import 'package:coin/RewardingLevels.dart';
import 'package:coin/Task.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ReadNewsScreen(),
  ));
}

class ReadNewsScreen extends StatelessWidget {
  const ReadNewsScreen({super.key});

  void _onTabTapped(BuildContext context, int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RewardingLevelsScreen()),
      );
    }
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: Colors.orange,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Text(
                      "Read News",
                      style: TextStyle(
                        color: Color(0xFFF7931A),
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        height: 16 / 20,
                        letterSpacing: 0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/Task2.png',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Rules of Task",
                style: TextStyle(
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  height: 16 / 20,
                  letterSpacing: 0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              _buildRuleText("1. Keep scrolling for 10 minutes."),
              _buildRuleText("2. Keep clicking every 30 seconds."),
              _buildRuleText("3. Don't leave still screen for more than 30 seconds."),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 3,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaskScreen()),
                    );
                  },
                  child: Text(
                    "Start Task",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 21.1 / 16,
                      letterSpacing: 0,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), 
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) => _onTabTapped(context, index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildRuleText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 15,
          height: 16 / 15,
          letterSpacing: 0,
          color: Colors.black,
        ),
      ),
    );
  }
}
