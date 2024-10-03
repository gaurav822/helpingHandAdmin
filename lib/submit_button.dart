import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressedCallback;
  const SubmitButton({super.key, required this.text, this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
            elevation: 0,
          ),
          onPressed: onPressedCallback,
          child: Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500))),
    );
  }
}