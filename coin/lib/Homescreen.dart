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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(""),
        actions: [
          
        ],
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

              // Task Section
              Center(
                child: const Text(
                  "Do Tasks, Earn Reward",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(150, 82, 0, 1),
                  ),
                ),
              ),

              const SizedBox(height: 5),
              Center(
                child: const Text(
                  "You can do these tasks as many times as you want",
                  
                  style: TextStyle(fontFamily: "RobotoMono",color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),

              // Task Cards
              TaskCard(
                image: "assets/Task1.png", // Change the asset path
                title: "Play Game",
                reward: "\$10",
              ),
              TaskCard(
                image: "assets/Task2.png", // Change the asset path
                title: "Read News",
                reward: "\$5",
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}

// Task Card Widget
class TaskCard extends StatelessWidget {
  final String image;
  final String title;
  final String reward;

  const TaskCard({
    super.key,
    required this.image,
    required this.title,
    required this.reward,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  reward,
                  style: const TextStyle(fontSize: 16, ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class DailyRewardScreen extends StatelessWidget {
  const DailyRewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Claim your Daily Reward",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 120, // Ensure the height is appropriate
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(7, (index) {
                bool isSelected = index == 3; // Middle one is highlighted
                double size = calculateSize(index); // Dynamic width & height
                double offsetY = calculateOffsetY(index); // Move boxes up

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Transform.translate(
                    offset: Offset(0, offsetY), // Move vertically
                    child: Container(
                      width: size,
                      height: size, // Ensuring height is dynamic
                      decoration: BoxDecoration(
                        color:!isSelected
                            ?  Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(size * 0.2),
                        border: isSelected
                            ? Border.all(color: Colors.orange, width: 3)
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "\$2\nAD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isSelected
                            ?  Colors.orange
                            : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  /// Dynamically calculates the size (width & height) based on distance from center
  double calculateSize(int index) {
    int centerIndex = 3; // Middle index
    int distance = (index - centerIndex).abs();
    return 85 - (distance * 18); // Both width & height decrease
  }

  /// Moves boxes up based on distance from center
  double calculateOffsetY(int index) {
    int centerIndex = 3;
    int distance = (index - centerIndex).abs();
    return -distance * 10; // Moves up gradually
  }
}



class CustomUI extends StatelessWidget {
  const CustomUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildIcon("assets/Profile.png","John Doe"), 
        _buildIcon("assets/Level.png","Level 01"),
        _buildIcon("assets/Wallet.png","\$25.00"),
      ],
    );
  }

  Widget _buildIcon(String imagePath,String text) {
    return Row(children: [
      Image.asset(
      imagePath,
      width: 50, 
      height: 50, 
    ),
    Text(text)
    ]
  );}
}
