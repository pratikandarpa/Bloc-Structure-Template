
class Validator{
  static String? emptyValidator(String? value) {

    if (value?.isEmpty ?? true) {
      return "Field must not be empty.";
    } else {
      return null;
    }
  }
}