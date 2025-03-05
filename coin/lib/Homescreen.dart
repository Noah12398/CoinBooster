import 'package:coin/CustomUI.dart';
import 'package:coin/DailyRewardScreen.dart';
import 'package:coin/Readnews.dart';
import 'package:coin/RewardingLevels.dart';
import 'package:coin/TaskCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onTabTapped(BuildContext context, int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  RewardingLevelsScreen()),
      );
    }
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomUI(),
              const SizedBox(height: 10),
              DailyRewardScreen(),
              const SizedBox(height: 20),

              const Center(
                child: Text(
                  "Do Tasks, Earn Reward",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    height: 16 / 20,
                    color: Color(0xFF965200),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 5),
              const Center(
                child: Text(
                  "You can do these tasks as many times as you want",
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    height: 16 / 14,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),

              TaskCard(
                image: "assets/Task1.png",
                title: "Play Game",
                reward: "\$10",
                link: null,
              ),
              SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
              TaskCard(
                image: "assets/Task2.png",
                title: "Read News",
                reward: "\$5",
                link: ReadNewsScreen(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) => _onTabTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Levels"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
