import 'package:flutter/material.dart';

class AnimatedIconExample extends StatefulWidget {

  final Function onTap;

  const AnimatedIconExample({Key? key, required this.onTap}) : super(key: key);

  @override
  _AnimatedIconExampleState createState() => _AnimatedIconExampleState(onTap);
}

class _AnimatedIconExampleState extends State<AnimatedIconExample>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  final Function onTapFunction;
  var isNight = false;

  _AnimatedIconExampleState(this.onTapFunction);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          !isNight ? _animationController.forward() : _animationController.reverse();
          isNight = !isNight;
          onTapFunction();
        },
        child: AnimatedIcon(
          size: 40,
          color: Colors.green,
          icon: AnimatedIcons.play_pause,
          progress: _animationController,
        ),
      );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
