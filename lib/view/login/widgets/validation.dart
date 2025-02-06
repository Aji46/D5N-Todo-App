class ValidationUtils {
  static String? validateemail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+").hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Field can't be empty";
    }
    return null;
  }
}
