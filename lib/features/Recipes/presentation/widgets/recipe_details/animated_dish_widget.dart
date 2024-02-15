// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedDishWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final String imageUrl;
  final Duration dishPlayTime;
  const AnimatedDishWidget({
    super.key,
    required this.constraints,
    required this.imageUrl,
    required this.dishPlayTime,
  });

  @override
  State<AnimatedDishWidget> createState() => _AnimatedDishWidgetState();
}

class _AnimatedDishWidgetState extends State<AnimatedDishWidget> {
  double val=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {

        val+= 0.001;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.constraints.maxHeight * 0.31,
      width: widget.constraints.maxWidth * 0.8,
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: val * pi * 0.85,
        child: Image.asset(
          widget.imageUrl,
          fit: BoxFit.contain,
        )
            .animate()
            .scaleXY(
                begin: 0.0,
                end: 1.0,
                duration: widget.dishPlayTime,
                curve: Curves.decelerate)
            .fadeIn()
            .blurXY(begin: 10, end: 0),
      ),
    );
  }
}
