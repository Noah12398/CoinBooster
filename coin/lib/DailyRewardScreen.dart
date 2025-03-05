import 'package:flutter/material.dart';

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
            fontFamily: 'Roboto', // Correct way to specify font
            fontWeight: FontWeight.w700, // Use FontWeight.w700 instead of 700
            fontSize: 20, // No need for 'px'
            height: 16 / 20, // Equivalent to line-height
            letterSpacing: 0,
            color: Color(0xFF965200), // Correctly setting color
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
                        color: !isSelected ? Colors.orange : Colors.white,
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
                          color: isSelected ? Colors.orange : Colors.white,
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