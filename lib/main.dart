import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Money Circular Dialer")),
        body: const Center(
          child: InteractiveMoneyDialer(),
        ),
      ),
    );
  }
}

// class MoneyCircularDialer extends StatelessWidget {
//   final double progress; // Progress value between 0.0 - 1.0
//   final double amount; // Current amount
//   final double maxAmount; // Maximum amount

//   const MoneyCircularDialer({
//     super.key,
//     required this.progress,
//     required this.amount,
//     required this.maxAmount,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: const Size(200, 200), // Diameter of the circular dial
//       painter: DialerPainter(progress, amount, maxAmount),
//     );
//   }
// }

// class DialerPainter extends CustomPainter {
//   final double progress;
//   final double amount;
//   final double maxAmount;

//   DialerPainter(this.progress, this.amount, this.maxAmount);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2 - 10;
//     const strokeWidth = 15.0;

//     // Background circle
//     Paint backgroundPaint = Paint()
//       ..color = Colors.grey[300]!
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth;

//     // Progress circle
//     Paint progressPaint = Paint()
//       ..shader = const LinearGradient(
//         colors: [Colors.green, Colors.lightGreenAccent],
//       ).createShader(Rect.fromCircle(center: center, radius: radius))
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round;

//     // Draw the background circle
//     canvas.drawCircle(center, radius, backgroundPaint);

//     // Draw the progress arc
//     double angle = 2 * 3.141592653589793 * progress;
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       -3.141592653589793 / 2,
//       angle,
//       false,
//       progressPaint,
//     );

//     // Draw text (amount)
//     TextPainter textPainter = TextPainter(
//       text: TextSpan(
//         text: "\$${amount.toStringAsFixed(2)}",
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout();
//     textPainter.paint(
//         canvas,
//         center.translate(
//             -textPainter.width / 2, -textPainter.height / 2)); // Center text
//   }

//   @override
//   bool shouldRepaint(DialerPainter oldDelegate) {
//     return oldDelegate.progress != progress;
//   }
// }

// class MoneyCircularDialer extends StatefulWidget {
//   const MoneyCircularDialer({super.key});

//   @override
//   _MoneyCircularDialerState createState() => _MoneyCircularDialerState();
// }

// class _MoneyCircularDialerState extends State<MoneyCircularDialer>
//     with SingleTickerProviderStateMixin {
//   double _progress = 0.5; // Initial progress (50%)
//   double _amount = 500;
//   final double _maxAmount = 1000;

//   // Animation controller
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     _animation =
//         Tween<double>(begin: 0.0, end: _progress).animate(_animationController)
//           ..addListener(() {
//             setState(() {}); // Rebuild when animation updates
//           });
//     _animationController.forward();
//   }

//   void _updateProgress(double newProgress) {
//     setState(() {
//       _progress = newProgress;
//       _amount = _maxAmount * _progress;
//       _animation = Tween<double>(begin: _animation.value, end: _progress)
//           .animate(_animationController)
//         ..addListener(() {
//           setState(() {});
//         });
//       _animationController.forward(from: 0.0); // Restart animation
//     });
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CustomPaint(
//           size: const Size(200, 200),
//           painter: DialerPainter(_animation.value, _amount, _maxAmount),
//         ),
//         const SizedBox(height: 20),
//         // Slider to control progress
//         Slider(
//           value: _progress,
//           min: 0.0,
//           max: 1.0,
//           divisions: 20,
//           label: '${(_progress * 100).round()}%',
//           onChanged: (double value) {
//             _updateProgress(value);
//           },
//         ),
//       ],
//     );
//   }
// }

// class DialerPainter extends CustomPainter {
//   final double progress;
//   final double amount;
//   final double maxAmount;

//   DialerPainter(this.progress, this.amount, this.maxAmount);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2 - 10;
//     const strokeWidth = 15.0;

//     // Background circle
//     Paint backgroundPaint = Paint()
//       ..color = Colors.grey[300]!
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth;

//     // Progress circle
//     Paint progressPaint = Paint()
//       ..shader = const LinearGradient(
//         colors: [Colors.green, Colors.lightGreenAccent],
//       ).createShader(Rect.fromCircle(center: center, radius: radius))
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round;

//     // Draw background circle
//     canvas.drawCircle(center, radius, backgroundPaint);

//     // Draw progress arc
//     double angle = 2 * 3.141592653589793 * progress;
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       -3.141592653589793 / 2,
//       angle,
//       false,
//       progressPaint,
//     );

//     // Draw text (amount)
//     TextPainter textPainter = TextPainter(
//       text: TextSpan(
//         text: "\$${amount.toStringAsFixed(2)}",
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout();
//     textPainter.paint(
//         canvas,
//         center.translate(
//             -textPainter.width / 2, -textPainter.height / 2)); // Center text
//   }

//   @override
//   bool shouldRepaint(DialerPainter oldDelegate) {
//     return oldDelegate.progress != progress;
//   }
// }

class InteractiveMoneyDialer extends StatefulWidget {
  const InteractiveMoneyDialer({super.key});

  @override
  State<InteractiveMoneyDialer> createState() => _InteractiveMoneyDialerState();
}

class _InteractiveMoneyDialerState extends State<InteractiveMoneyDialer> {
  double _progress = 0.5; // Initial progress (50%)
  final double _maxAmount = 1000;
  double _amount = 500;
  ui.Image? knobImage;

  @override
  void initState() {
    super.initState();
    _loadImage(); // Call to load the image
  }

  void _updateProgress(Offset localPosition, Size size) {
    final center = size.center(Offset.zero);
    final dx = localPosition.dx - center.dx;
    final dy = localPosition.dy - center.dy;
    final angle = atan2(dy, dx); // Get angle in radians

    // Normalize angle (convert to progress between 0 and 1)
    double normalizedAngle = (angle + pi / 2) / (2 * pi);
    if (normalizedAngle < 0) normalizedAngle += 1;

    setState(() {
      _progress = normalizedAngle;
      _amount = _progress * _maxAmount;
    });
  }

  // Load image from assets
  Future<void> _loadImage() async {
    final data = await DefaultAssetBundle.of(context).load('assets/knob.jpg');
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    setState(() {
      knobImage = frame.image; // Set the loaded image
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onPanUpdate: (details) {
          _updateProgress(details.localPosition, const Size(200, 200));
        },
        child: CustomPaint(
          size: const Size(200, 200),
          painter: DialerPainter(
            _progress,
            _amount,
            _maxAmount,
            knobImage!,
          ),
        ),
      ),
    );
  }
}

class DialerPainter extends CustomPainter {
  final double progress;
  final double amount;
  final double maxAmount;
  final ui.Image knobImage;

  DialerPainter(this.progress, this.amount, this.maxAmount, this.knobImage);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    const strokeWidth = 15.0;

    // Background circle
    Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Progress circle
    Paint progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.green, Colors.lightGreenAccent],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw the background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the progress arc
    double angle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      angle,
      false,
      progressPaint,
    );
    // Calculate knob position
    double knobAngle = angle - pi / 2;
    final knobRadius = radius; // Position knob on circle edge
    Offset knobPosition = Offset(
      center.dx + knobRadius * cos(knobAngle),
      center.dy + knobRadius * sin(knobAngle),
    );

    // Draw knob image centered at calculated position
    double knobSize = 30; // Knob image size
    canvas.drawImageRect(
      knobImage,
      Rect.fromLTRB(
          0, 0, knobImage.width.toDouble(), knobImage.height.toDouble()),
      Rect.fromCenter(center: knobPosition, width: knobSize, height: knobSize),
      Paint(),
    );
    // Draw amount text
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: "\$${amount.toStringAsFixed(2)}",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas,
        center.translate(-textPainter.width / 2, -textPainter.height / 2));
  }

  @override
  bool shouldRepaint(DialerPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
