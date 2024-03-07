import 'package:flutter/foundation.dart';

class GenderNotifier with ChangeNotifier {
  bool _male = false;
  bool _female = false;

  bool get male => _male;
  bool get female => _female;

  void toggleSelection(String genderSelected) {
    switch (genderSelected) {
      case 'male':
        if (_male == true) {
          _male = false;
          notifyListeners();
        } else {
          _male = true;
          _female = false;
          notifyListeners();
        }
        break;

      case 'female':
        if (_female == true) {
          _female = false;
          notifyListeners();
        } else {
          _male = false;
          _female = true;
          notifyListeners();
        }
        break;
    }
  }

  String? getSelectedGender() {
    if (male == true) {
      return 'Male';
    } else if (female == true) {
      return 'Female';
    }
    return null;
  }
}
