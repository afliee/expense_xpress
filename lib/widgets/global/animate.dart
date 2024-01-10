import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppAnimate {
  // static const Duration duration = Duration(milliseconds: 300);
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationSlow = Duration(milliseconds: 500);
  static const Duration durationVerySlow = Duration(milliseconds: 1000);

  int _duration = 300;
  int _delay = 0;
  Curve _curve = Curves.easeInOut;

  AppAnimate({int? duration, int? delay, Curve? curve}) {
    _duration = duration ?? _duration;
    _delay = delay ?? _delay;
    _curve = curve ?? _curve;
  }

  Widget fade({required Widget child}) {
    return Animate(
      effects: [
        FadeEffect(
          duration: Duration(milliseconds: _duration),
          delay: Duration(milliseconds: _delay),
          curve: _curve,
        ),
      ],
      child: child,
    );
  }

  Widget slide({required Widget child}) {
    return Animate(
      effects: [
        SlideEffect(
          duration: Duration(milliseconds: _duration),
          delay: Duration(milliseconds: _delay),
          curve: _curve,
        ),
      ],
      child: child,
    );
  }

  Widget scale({required Widget child}) {
    return Animate(
      effects: [
        ScaleEffect(
          duration: Duration(milliseconds: _duration),
          delay: Duration(milliseconds: _delay),
          curve: _curve,
        ),
      ],
      child: child,
    );
  }
}
