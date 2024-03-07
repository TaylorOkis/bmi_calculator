import '../models/user_model.dart';

String calculateBMI(UserModel user) {
  double heightInMeters = user.height * 0.01;
  double bmi = user.weight / (heightInMeters * heightInMeters);
  return bmi.toStringAsFixed(1);
}
