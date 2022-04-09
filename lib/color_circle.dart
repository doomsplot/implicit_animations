import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {Key? key, this.onTap, required this.color, this.selected = false})
      : super(key: key);

  final VoidCallback? onTap;
  final Color color;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
        width: selected ? 70 : 50,
        height: selected ? 70 : 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          color: color,
          borderRadius: BorderRadius.circular(selected ? 50 : 10),
        ),
      ),
    );
  }
}
