import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10.0,
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          var cursorPos = controller.selection.base.offset;

          // if textfield cursor not selected
          if (cursorPos == -1) {
            controller.text += number.toString();
          }

          // Right text of cursor position
          String suffixText = controller.text.substring(cursorPos);

          // Add new text on cursor position
          String specialChars = number.toString();
          int length = specialChars.length;

          // Get the left text of cursor
          String prefixText = controller.text.substring(0, cursorPos);

          controller.text = prefixText + specialChars + suffixText;

          // Cursor move to end of added text
          controller.selection = TextSelection(
            baseOffset: cursorPos + length,
            extentOffset: cursorPos + length,
          );
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
