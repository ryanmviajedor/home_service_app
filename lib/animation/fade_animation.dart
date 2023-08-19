import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final MovieTween tween = MovieTween()
      ..scene(
              begin: const Duration(milliseconds: 0),
              end: const Duration(milliseconds: 1000))
          .tween('opacity', Tween(begin: 0.0, end: 100.0))
      ..scene(
              begin: const Duration(milliseconds: 1000),
              end: const Duration(milliseconds: 1500),
              curve: Curves.easeOut)
          .tween('translateY', Tween(begin: 100.0, end: 200.0));

    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: (child as Map)["opacity"],
        child: Transform.translate(offset: Offset(0, value.get('translateY'))),
      ),
    );
  }
}
