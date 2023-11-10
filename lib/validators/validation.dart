class Validation {
  static bool isValidName(String name) {
    return name.isNotEmpty;
  }

  static bool isValidEmail(String email) {
    return email.contains("@") && email.length > 6;
  }

  static bool isValidPassword(String password) {
    return password.length > 5;
  }

  static bool isValidPasswordConfirm(String password, String passwordConfirm) {
    return passwordConfirm == password;
  }
}
