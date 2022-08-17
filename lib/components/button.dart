import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const WidgetButton(
      {Key? key,
      required this.title,
      this.color = const Color(0xffa5a5a5),
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 10,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
        ),
      ),
    );
  }
}
