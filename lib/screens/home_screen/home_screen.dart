import 'package:bmi_calculator/screens/home_screen/widgets/screen_widgets.dart';
import 'package:bmi_calculator/services/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/gender_notifier.dart';
import '../../models/bmi_comments.dart';
import '../../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightTextEditingController =
      TextEditingController();
  final TextEditingController _weightTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    _heightTextEditingController.dispose();
    _weightTextEditingController.dispose();
    super.dispose();
  }

  dynamic getBMI() {
    double userWeight = double.parse(_weightTextEditingController.text);
    double userHeight = double.parse(_heightTextEditingController.text);

    if (userHeight <= 0 || userWeight <= 0) {
      return UnimplementedError();
    }

    final UserModel user = UserModel(weight: userWeight, height: userHeight);
    return calculateBMI(user);
  }

  String getComment(bmi) {
    bmi = double.parse(bmi);
    if (bmi < 18.5) {
      return comments['underweight']!;
    } else if (bmi > 18.5 && bmi < 24.9) {
      return comments['normalweight']!;
    } else if (bmi > 25 && bmi < 29.9) {
      return comments['overweight']!;
    } else if (bmi > 30) {
      return comments['obese']!;
    } else {
      return 'Invalid BMI';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.bookmarks_rounded,
              color: Colors.green.shade900,
            ),
            iconSize: 30,
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            fixedSize: const Size(298, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onPressed: () {
            String bmiResult = getBMI();
            String bmiComment = getComment(bmiResult);
            String? selectedGender =
                Provider.of<GenderNotifier>(context, listen: false)
                    .getSelectedGender();
            Navigator.of(context).pushNamed(
              '/result',
              arguments: [bmiResult, bmiComment, selectedGender],
            );
          },
          child: const Text('Submit'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () =>
                        Provider.of<GenderNotifier>(context, listen: false)
                            .toggleSelection('male'),
                    child: Consumer<GenderNotifier>(
                        builder: (context, value, child) {
                      return genderWidget(
                        Icons.man_2_rounded,
                        "Male",
                        value.male,
                      );
                    }),
                  ),
                  const SizedBox(width: 22.0),
                  GestureDetector(
                    onTap: () =>
                        Provider.of<GenderNotifier>(context, listen: false)
                            .toggleSelection('female'),
                    child: Consumer<GenderNotifier>(
                        builder: (context, value, child) {
                      return genderWidget(
                        Icons.woman_2_rounded,
                        "Female",
                        value.female,
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              parameterWidget('Height(in cm)', _heightTextEditingController),
              const SizedBox(height: 18),
              parameterWidget('Weight(in kgs)', _weightTextEditingController),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
