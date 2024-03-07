import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, required this.bmi});

  final String bmi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 275,
      height: 10,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Container(
                height: 10,
                width: 275 * 0.185,
                color: Colors.yellow,
              ),
              Container(
                height: 10,
                width: 275 * 0.064,
                color: Colors.green,
              ),
              Container(
                height: 10,
                width: 275 * 0.049,
                color: Colors.orange,
              ),
              Container(
                height: 10,
                width: 275 * 0.7,
                color: Colors.red,
              ),
            ],
          ),
          Positioned(
            top: -10,
            left: 275 * (double.parse(bmi) / 100),
            width: 3.5,
            height: 30,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//   return SliderTheme(
//     data: SliderTheme.of(context).copyWith(
//       thumbShape: const RoundSliderThumbShape(),
//       activeTrackColor: Colors.transparent,
//       inactiveTrackColor: Colors.red,
//     ),
//     child: Slider(
//       min: 0.0,
//       max: 100.0,
//       value: double.parse(bmi),
//       label: bmi,
//       onChanged: null,
//     ),
//   );
// }
