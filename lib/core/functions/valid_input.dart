import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "lastName") {
    if (!GetUtils.isUsername(val)) {
      return "not valid lastName(username) ";
    }
  }
  if (type == "firstName") {
    if (!GetUtils.isUsername(val)) {
      return "not valid firstName(username) ";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }
  if (val.isEmpty) {
    return "Can't Be Empty";
  }
  if (val.length < min) {
    return "Can't Be Less Than $min";
  }
  if (val.length > max) {
    return "Can't Be Larger Than $max";
  }
}
