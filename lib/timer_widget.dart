import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' hide Colors;

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
    required this.currentMillis,
    required this.maxMillis,
  });

  final int currentMillis;
  final int maxMillis;

  @override
  Widget build(BuildContext context) {
    final color =
        currentMillis >= 0 ? Theme.of(context).primaryColor : Colors.red;
    final textColor = currentMillis >= 0 ? Colors.grey[600]! : Colors.red;
    return Stack(
      children: [
        _OuterCircleWidget(
          color: color,
          degrees: _currentDegrees(),
        ),
        Center(
          child: Text(
            _formatDuration(Duration(milliseconds: currentMillis)),
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: textColor),
          ),
        ),
      ],
    );
  }

  double _currentDegrees() {
    return 360 * (maxMillis - currentMillis) / maxMillis;
  }

  String _formatDuration(Duration duration) {
    final String hours = duration.inHours.abs().toString().padLeft(2, '0');
    final String minutes =
        duration.inMinutes.remainder(60).abs().toString().padLeft(2, '0');
    final String seconds =
        duration.inSeconds.remainder(60).abs().toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }
}

class _OuterCircleWidget extends StatelessWidget {
  final double degrees;
  final Color color;

  const _OuterCircleWidget({
    required this.degrees,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return CustomPaint(
        painter: _OuterCirclePainter(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          degrees: degrees,
          color: color,
        ),
      );
    });
  }
}

class _OuterCirclePainter extends CustomPainter {
  _OuterCirclePainter({
    required this.height,
    required this.width,
    required this.degrees,
    required this.color,
  });

  final double height;
  final double width;
  final double degrees;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final size = min(height, width);

    Rect rect = Rect.fromCenter(
      center: Offset(width / 2, height / 2),
      width: size,
      height: size,
    );

    final backgroundPaint = Paint()
      ..color = color.withOpacity(0.3)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      rect,
      radians(0),
      radians(360),
      false,
      backgroundPaint,
    );

    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    const startDegrees = -90.0;

    canvas.drawArc(
      rect,
      radians(startDegrees),
      radians(degrees),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _OuterCirclePainter oldDelegate) {
    return oldDelegate.degrees != degrees ||
        oldDelegate.color != color ||
        oldDelegate.height != height ||
        oldDelegate.width != width;
  }
}
