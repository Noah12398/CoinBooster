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
      home: TaskScreen(),
    );
  }
}

class TaskScreen extends StatelessWidget {
  final List<String> sidebarImages = [
    "assets/Article3.png",
    "assets/Article4.png",
    "assets/Article5.png",
    "assets/Article6.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // Less rounded corners
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 20,
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                  const Text(
                    "10.00",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto', // Font family
                      fontWeight: FontWeight.w500, // Medium weight
                      fontSize: 15, // Font size in logical pixels
                      height: 1.1, // Line height (16px / 15px)
                      letterSpacing: 0, // No extra spacing
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Button color
                      foregroundColor: Colors.black, // Text color
                      side: const BorderSide(
                          color: Colors.black, width: 1), // Black border
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // Less rounded corners
                      ),
                    ),
                    child: const Text(
                      "Claim",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        height: 1.1,
                        letterSpacing: 0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildArticleCard(
            "assets/Article1.png",
            "Discover the 10 Best Hairstyles According to Your Face Shape",
          ),
          buildArticleCard2(
            "assets/Article2.png",
            "Most Beautiful Things to Do in Sydney with Your Boyfriend",
          ),
        ],
      ),
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

  Widget buildArticleCard(String imagePath, String title) {
    return Card(
      elevation: 3,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildArticleCard2(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Main Article
          Expanded(
            flex: 3,
            child: Card(
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    child: Image.asset(
                      imagePath, // Fixed image path
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: const [
                            Text(
                              "Jane Doe • May 10, 2019",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Spacer(),
                            Icon(Icons.comment, size: 18, color: Colors.grey),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Any place we meet up, we feel super good. There are amazing things to do in Sydney...",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Right: Sidebar Thumbnails
          Expanded(
            flex: 1,
            child: Column(
              children: sidebarImages.map((imagePath) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
