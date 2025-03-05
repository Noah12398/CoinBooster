import 'package:coin/Homescreen.dart';
import 'package:flutter/material.dart';

class RewardingLevelsScreen extends StatelessWidget {
  final List<LevelData> levels = [
    LevelData(level: "Level 01", minWithdrawal: 50, earnings: 25),
    LevelData(level: "Level 02", minWithdrawal: 100, earnings: 0),
    LevelData(level: "Level 03", minWithdrawal: 150, earnings: 0),
  ];
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
      body: Column(
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
                  "Rewarding Levels",
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children:
                    levels.map((level) => RewardCard(level: level)).toList(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) => _onTabTapped(context, index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final LevelData level;

  RewardCard({required this.level});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double progress =
            (level.earnings / level.minWithdrawal).clamp(0.0, 1.0);
        double textPosition = (constraints.maxWidth * progress) - 15;

        return Stack(
          clipBehavior: Clip.none, 
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              margin: EdgeInsets.only(bottom: 40), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                    ),
                    child: Text(level.level,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                          height: 16 / 14,
                          letterSpacing: 0.0,
                        )),
                  ),
                  SizedBox(height: 60), 
                ],
              ),
            ),

            Positioned(
              left: -4,
              right: -4,
              top:
                  25, 
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Minimum Withdrawal = \$${level.minWithdrawal}",
                        style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          height: 16 / 15,
                          letterSpacing: 0,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Your earnings = \$${level.earnings}",
                        style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            height: 16 / 14,
                            letterSpacing: 0,
                            color: Color(0xE5555555)),
                      ),
                      SizedBox(height: 10),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.orange, width: 2),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.orange),
                                minHeight: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            left:
                                textPosition / 2 - 15, 
                            top: 2,
                            child: Text(
                                "${(progress * 100).toInt()}%", 
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'RobotoMono',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  height: 16 / 12, 
                                  letterSpacing: 0,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
          ],
        );
      },
    );
  }
}

class LevelData {
  final String level;
  final int minWithdrawal;
  final int earnings;

  LevelData(
      {required this.level,
      required this.minWithdrawal,
      required this.earnings});
}
