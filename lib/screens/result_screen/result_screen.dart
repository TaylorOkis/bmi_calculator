import 'package:bmi_calculator/screens/result_screen/widgets/screen_widgets.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.bmi, required this.bmiComment, this.gender});

  final String bmi;
  final String bmiComment;
  final String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.bookmark_rounded,
              color: Colors.green.shade900,
            ),
            iconSize: 30,
            onPressed: null,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                resultWidget(bmi, gender),
                commentWidget(bmiComment),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
