import 'package:flutter/material.dart';

import 'input_widget.dart';

Widget genderWidget(IconData icon, String gender, bool selected) {
  return Container(
    width: 138,
    height: 122,
    decoration: BoxDecoration(
      border: Border.all(
        color: selected ? Colors.grey.shade800 : Colors.grey.shade300,
        style: BorderStyle.solid,
        width: selected ? 1.5 : 1.0,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,
              size: selected ? 60.0 : 50.0,
              color: selected ? Colors.blue : Colors.grey.shade600),
          Text(
            gender,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}

Widget parameterWidget(
    String parameter, TextEditingController textEditingController) {
  return Container(
    width: 298,
    height: 152,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey.shade300,
        style: BorderStyle.solid,
        width: 1.0,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputWidget(textEditingController: textEditingController),
          Text(
            parameter,
            style: TextStyle(
              fontSize: 12.5,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
