import 'dart:math';

import 'package:flutter/material.dart';

class RotationBoxWidget extends StatefulWidget {
  const RotationBoxWidget({super.key});

  @override
  _RotationBoxWidgetState createState() => _RotationBoxWidgetState();
}

class _RotationBoxWidgetState extends State<RotationBoxWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..repeat();

    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Stack(children: [
          AnimatedBuilder(
            animation: animation,
            child: Stack(
              children: [
                Container(color: Colors.red, width: 250, height: 250),
                Transform.rotate(
                  angle: -pi / 4,
                  child: Container(
                      color: Colors.greenAccent, width: 250, height: 250),
                ),
                Transform.rotate(
                  angle: -pi / 8,
                  child:
                      Container(color: Colors.yellow, width: 250, height: 250),
                ),
              ],
            ),
            builder: (context, child) => Transform.rotate(
              angle: animation.value,
              child: child,
            ),
          ),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.8),
              image: const DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.bottomLeft,
                image: AssetImage('assets/imgs/12.png'),
              ),
            ),
          )
        ]),
      );
}
