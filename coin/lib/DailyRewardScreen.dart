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
            fontFamily: 'Roboto', 
            fontWeight: FontWeight.w700,
            fontSize: 20, 
            height: 16 / 20, 
            letterSpacing: 0,
            color: Color(0xFF965200), 
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 120,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(7, (index) {
                bool isSelected = index == 3;
                double size = calculateSize(index);
                double offsetY = calculateOffsetY(index);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Transform.translate(
                    offset: Offset(0, offsetY), 
                    child: Container(
                      width: size,
                      height: size, 
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
                          fontSize: size*0.2,
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

  double calculateSize(int index) {
    int centerIndex = 3; 
    int distance = (index - centerIndex).abs();
    return 85 - (distance * 18); 
  }

  double calculateOffsetY(int index) {
    int centerIndex = 3;
    int distance = (index - centerIndex).abs();
    return -distance * 10; 
  }
}