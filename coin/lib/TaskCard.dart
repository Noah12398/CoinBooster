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
              borderRadius: const BorderRadius.all(
                 Radius.circular(10),
              ),
              child: Image.asset(
                image,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0, 
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(0.75), 
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
                        fontFamily: 'RobotoMono', 
                        fontWeight: FontWeight
                            .w700, 
                        fontSize: 15, 
                        height: 16 / 15, 
                        letterSpacing: 0,
                        color: Colors.black, 
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      reward,
                      style: const TextStyle(
                        fontFamily: 'RobotoMono',
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
