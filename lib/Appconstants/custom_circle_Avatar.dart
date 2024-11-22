import 'package:flutter/material.dart';

class CustumCircleAvatar extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  CustumCircleAvatar({
    required this.icon,
    this.size = 50,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.iconColor = Colors.black,
  });
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // Half the size
      backgroundColor: backgroundColor,
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}