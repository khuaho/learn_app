import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween<double>('opacity', Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))
      ..tween<double>(
        'translateY',
        Tween(begin: -30.0, end: 0.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );

    return PlayAnimationBuilder(
      tween: tween,
      duration: const Duration(seconds: 1),
      builder: (context, value, _) {
        return Opacity(
          opacity: value.get('opacity'),
          child: Transform.translate(
            offset: Offset(
              0,
              value.get('translateY'),
            ),
            child: child,
          ),
        );
      },
      onCompleted: () {
        // do something ...
      },
    );
  }
}
