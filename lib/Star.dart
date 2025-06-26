import 'dart:math';

class Star {
  double x;
  double y;
  double size;
  double opacity;
  double speed;

  Star({
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
    required this.speed,
  });

  void update() {
    y += speed;
    if (y > 1.0) {
      y = 0.0;
      x = Random().nextDouble();
    }
    opacity += (Random().nextDouble() - 0.5) * 0.02;
    opacity = opacity.clamp(0.3, 1.0);
  }
}
