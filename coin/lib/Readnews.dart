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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Padding(
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
                    color: Colors.orange, // Adjust the color
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
                SizedBox(width: 48), // Placeholder for balancing alignment
              ],
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/Task2.png', // Change this to your actual image path
                  width: double.infinity,
                  height: 150,
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
            SizedBox(height: 10),
            Text(
              "1. Keep scrolling for 10 minutes.",
              style: TextStyle(
                fontFamily: 'Roboto', // Correct way to specify font
                fontWeight:
                    FontWeight.w400, // Use FontWeight.w400 instead of 400
                fontSize: 15, // No need for 'px'
                height: 16 / 15, // Equivalent to line-height
                letterSpacing: 0, // No need for 'px'
                color: Colors.black, // Add color if needed
              ),
            ),
            Text(
              "2. Keep clicking every 30 seconds.",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 15,
                height: 16 / 15,
                letterSpacing: 0,
                color: Colors.black,
              ),
            ),
            Text(
              "3. Don't leave still screen for more than 30 seconds.",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 15,
                height: 16 / 15,
                letterSpacing: 0,
                color: Colors.black,
              ),
            ),
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
                    fontFamily: 'RobotoMono', // Correct Dart syntax
                    fontWeight:
                        FontWeight.w700, // Use FontWeight.w700 instead of 700
                    fontSize: 16, // No 'px'
                    height: 21.1 / 16, // Equivalent to line-height
                    letterSpacing: 0, // No need for '%'
                    textBaseline: TextBaseline
                        .alphabetic, // Ensures proper alignment if needed
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
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
}
