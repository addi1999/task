import 'package:flutter/material.dart';

class ShadowWidget extends StatelessWidget {
  final Widget child;
  final Color shadowColor;

  const ShadowWidget({
    Key? key,
    required this.child,
    required this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
