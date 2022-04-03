import 'package:flutter/material.dart';

Widget input(
  String hint,
  TextEditingController controller,
) {
  return Container(
    child: TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      style: const TextStyle(
          fontSize: 16, color: Colors.white, fontFamily: "Lato"),
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white60,
        ),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white, width: 3)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white, width: 1)),
      ),
    ),
  );
}
