import 'package:flutter/material.dart';
import 'activity_two.dart';

class ActivityOne extends StatefulWidget {
  const ActivityOne({super.key});

  @override
  State<ActivityOne> createState() => _ActivityOneState();
}

class _ActivityOneState extends State<ActivityOne> {
  double stressLevel = 100.0;

  void increaseStress() {
    setState(() {
      if (stressLevel < 100) {
        stressLevel += 10;
      }
    });
  }

  void decreaseStress() {
    setState(() {
      if (stressLevel > 0) {
        stressLevel -= 10;
      }
    });
  }

  String getStressText() {
    if (stressLevel >= 70) {
      return "You're Stressed";
    } else if (stressLevel >= 40) {
      return "Moderate Stress";
    } else {
      return "You're Relaxed";
    }
  }

  Color getStressColor() {
    if (stressLevel >= 70) {
      return const Color(0xFFE74C3C);
    } else if (stressLevel >= 40) {
      return const Color(0xFFF39C12);
    } else {
      return const Color(0xFF27AE60);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F6),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF27AE60).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF27AE60),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'Completed',
                                  style: TextStyle(
                                    color: Color(0xFF27AE60),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.ios_share, size: 22),
                            onPressed: () {},
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Title
                      const Text(
                        'You did good!',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '05 JUL 12:30pm',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Human Body Illustration Container
                      Container(
                        width: double.infinity,
                        height: 320,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F0EE),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Body silhouette
                            CustomPaint(
                              size: const Size(200, 280),
                              painter: BodySilhouettePainter(),
                            ),
                            // Brain icon
                            Positioned(
                              top: 40,
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.psychology,
                                  size: 40,
                                  color: Color(0xFFE74C3C),
                                ),
                              ),
                            ),
                            // Lungs icon
                            Positioned(
                              top: 140,
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  Icons.air,
                                  size: 45,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Stress Level Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Stress Level',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.show_chart,
                                      size: 20,
                                      color: Colors.grey[400],
                                    ),
                                    const SizedBox(width: 12),
                                    Icon(
                                      Icons.info_outline,
                                      size: 20,
                                      color: Colors.grey[400],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Relaxation Index',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${stressLevel.toInt()} %',
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  getStressText(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: getStressColor(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Progress Bar with +/- buttons
                            Row(
                              children: [
                                // Minus button
                                InkWell(
                                  onTap: decreaseStress,
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Progress bar
                                Expanded(
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Stack(
                                        children: [
                                          Container(
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 300),
                                            height: 32,
                                            width: constraints.maxWidth * (stressLevel / 100),
                                            decoration: BoxDecoration(
                                              color: getStressColor(),
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                          ),
                                          // Percentage markers
                                          Positioned.fill(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    '30%',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey[500],
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    '75%',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey[500],
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Plus button
                                InkWell(
                                  onTap: increaseStress,
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Icon Buttons Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIconButton(
                            Icons.psychology_outlined,
                            Colors.grey[300]!,
                            () {},
                          ),
                          const SizedBox(width: 16),
                          _buildIconButton(
                            Icons.favorite,
                            const Color(0xFF3498DB).withOpacity(0.2),
                            () {},
                            iconColor: const Color(0xFF3498DB),
                          ),
                          const SizedBox(width: 16),
                          _buildIconButton(
                            Icons.air,
                            Colors.grey[300]!,
                            () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ActivityTwo(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(
    IconData icon,
    Color bgColor,
    VoidCallback onTap, {
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 28,
          color: iconColor ?? Colors.grey[600],
        ),
      ),
    );
  }
}

// Custom painter for body silhouette
class BodySilhouettePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final path = Path();

    // Head
    canvas.drawCircle(
      Offset(size.width / 2, 40),
      35,
      paint,
    );

    // Neck
    path.moveTo(size.width / 2 - 15, 75);
    path.lineTo(size.width / 2 - 15, 95);
    path.lineTo(size.width / 2 + 15, 95);
    path.lineTo(size.width / 2 + 15, 75);
    path.close();

    // Torso
    path.moveTo(size.width / 2 - 50, 95);
    path.lineTo(size.width / 2 - 45, 200);
    path.lineTo(size.width / 2 + 45, 200);
    path.lineTo(size.width / 2 + 50, 95);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
