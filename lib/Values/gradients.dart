part of values;

class Gradients {
  static const LinearGradient curvesGradient3 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF687F7),
      Color(0xFFA8C84C),
    ],
  );

  static const LinearGradient curvesGradient4 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF90FFF8),
      Color(0xFF084840),
    ],
  );

  static const Gradient headerOverlayGradient = LinearGradient(
    begin: Alignment(0.51436, 1.07565),
    end: Alignment(0.51436, -0.03208),
    stops: [
      0,
      0.17571,
      1,
    ],
    colors: [
      Color.fromARGB(255, 0, 0, 0),
      Color.fromARGB(255, 8, 8, 8),
      Color.fromARGB(105, 45, 45, 45),
    ],
  );
}
