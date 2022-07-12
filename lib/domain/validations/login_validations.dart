class LoginValidation {
  static String? emailValidations(String? email) {
    const regexp = r'\S+@\S+\.\S+';
    if (email == null || email.isEmpty) {
      return "Enter the value to the field";
    } else if (!RegExp(regexp).hasMatch(email)) {
      return "Enter the valid email Address";
    } else {
      return null;
    }
  }

  static String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Enter the value to the field";
    } else {
      return null;
    }
  }
}
