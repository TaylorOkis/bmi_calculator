class UserModel {
  final double weight;
  final double height;

  UserModel({
    required this.weight,
    required this.height,
  });
}

// Underweight - below 18.5. A BMI below 18.5 indicates that you are underweight for your height. You need to get your weight up to avoid health problems.
// Normal range - 18.5 to 24.9. A BMI of 18.5 - 24.9 indicates that you are at healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing health problems.
// Overweight - 25 to 29.9. A BMI of 25 - 29.9 indicates that you are overweight for your height. By reducing your weight, you lower your risk of developing health problems.
// Obesity - 30 above. A BMI of 25 - 29.9 indicates that you are obese for your height. At this point, your risk of developing health problems is very high. You'll need to reduce your weight.
