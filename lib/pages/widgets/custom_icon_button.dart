import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, required this.onPressed, required this.icon}) : super(key: key);
  final void Function()? onPressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.grey,
          )),
    );
  }
}
