import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class CountdownTimer extends StatefulWidget {
  final Duration duration;
  final Color? progressCircleColor;
  const CountdownTimer({
    super.key,
    required this.duration,
    this.progressCircleColor,
  });

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  late Duration _remainingTime;
  late Duration _originalDuration;

  @override
  void initState() {
    super.initState();
    // Store the original duration for progress calculation
    _originalDuration = widget.duration;
    // Start with 20% of the time already gone (80% remaining)
    _remainingTime =
        Duration(seconds: (widget.duration.inSeconds * 0.91).round());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    // Use the original duration for progress calculation
    double progress = _remainingTime.inSeconds / _originalDuration.inSeconds;

    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: CircleProgressPainter(
                progress: progress,
                progressCircleColor:
                    widget.progressCircleColor ?? CustomColors.orange500Color),
            child: SizedBox(
              width: 140.h,
              height: 140.h,
            ),
          ),
          boldText(
            _formatDuration(_remainingTime),
            fontSize: 24.sp,
            color: widget.progressCircleColor ?? CustomColors.orange500Color,
          ),
        ],
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress;
  final Color progressCircleColor;
  CircleProgressPainter(
      {required this.progress, required this.progressCircleColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw the background circle (empty part)
    final backgroundPaint = Paint()
      ..color = progressCircleColor.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the progress circle (filled part)
    final progressPaint = Paint()
      ..color = progressCircleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    double sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // Start at the top
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircleProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
