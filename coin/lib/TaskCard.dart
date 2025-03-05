import 'package:coin/Readnews.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String image;
  final String title;
  final String reward;
  final ReadNewsScreen? link;
  const TaskCard({
    super.key,
    required this.image,
    required this.title,
    required this.reward,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (link != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => link!),
          );
        }
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
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
            Positioned(
              bottom: 0, // Ensures the text is at the bottom
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(0.75), // Semi-transparent background
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'RobotoMono', // Correct way to specify font
                        fontWeight: FontWeight
                            .w700, // Use FontWeight.w700 instead of 700
                        fontSize: 15, // No need for 'px'
                        height: 16 / 15, // Equivalent to line-height
                        letterSpacing: 0, // No need for 'px'
                        color: Colors.black, // Ensure text is visible
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      reward,
                      style: const TextStyle(
                        fontFamily: 'RobotoMono', // Correct way to specify font
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        height: 16 / 15,
                        letterSpacing: 0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
