//helper functions
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension FicListExtension<T> on List<T> {
  Iterable<E> mapIndexed<E>(E Function(int index, T item) map) sync* {
    for (var index = 0; index < length; index++) {
      yield map(index, this[index]);
    }
  }

  //animate list
  List<Widget> get animateList => (this as List<Widget>)
      .animate(interval: const Duration(milliseconds: 100))
      .fadeIn(duration: const Duration(milliseconds: 300))
      .slideY(
          begin: 0.50, end: 0.0, duration: const Duration(milliseconds: 200));

  List<Widget> get animateListFast => (this as List<Widget>)
      .animate(interval: const Duration(milliseconds: 70))
      .fadeIn(duration: const Duration(milliseconds: 300))
      .slideY(
          begin: 0.50, end: 0.0, duration: const Duration(milliseconds: 200));
}

extension MyWidget on Widget {
  Widget get fadeAnimation => animate().fadeIn(
        duration: const Duration(milliseconds: 1000),
      );
}
