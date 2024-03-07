import "package:flutter/material.dart";

import "slider_widget.dart";

Widget resultWidget(String bmi, String? gender) {
  return Container(
    width: 300,
    height: 180,
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
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            gender == null ? 'Your BMI is ' : '($gender) Your BMI is',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            bmi,
            style: const TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SliderWidget(bmi: bmi),
        ],
      ),
    ),
  );
}

Widget commentWidget(String bmiComment) {
  return Row(
    children: [
      const Image(
        image: AssetImage('assets/images/commentator.png'),
        alignment: Alignment.centerLeft,
        height: 250,
        width: 150,
      ),
      SizedBox(
        width: 170,
        child: Text(
          bmiComment,
          style: TextStyle(
            fontSize: 14.5,
            color: Colors.grey.shade700,
          ),
          softWrap: true,
          overflow: TextOverflow.clip,
        ),
      ),
    ],
  );
}
