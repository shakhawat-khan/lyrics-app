class ValidationMixin {
  emailValidator(value) {
    if (value == null || !value.contains('@')) {
      return 'please enter a valid email';
    }
  }

  passwordValidator(value) {
    if (value == null || value.length < 3) {
      return 'password length must be 4';
    }
  }
}
