import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppAnimate {
  // static const Duration duration = Duration(milliseconds: 300);
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationSlow = Duration(milliseconds: 500);
  static const Duration durationVerySlow = Duration(milliseconds: 1000);

  Duration _duration = const Duration(milliseconds: 300);
  Duration _delay = Duration.zero;
  Curve _curve = Curves.easeInOut;

  AppAnimate({Duration? duration, Duration? delay, Curve? curve}) {
    _duration = duration ?? _duration;
    _delay = delay ?? _delay;
    _curve = curve ?? _curve;
  }

  Widget fade({required Widget child}) {
    return Animate(
      effects: [
        FadeEffect(
          duration: _duration,
          delay: _delay,
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
          duration: _duration,
          delay: _delay,
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
          duration: _duration,
          delay: _delay,
          curve: _curve,
        ),
      ],
      child: child,
    );
  }
}
