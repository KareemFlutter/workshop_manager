class AppValidation {
  static String? emailValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? phoneNumberVaildtor(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return "Phone Number Must Be Greater than 11";
    }
    if (phoneNumber.length < 10) {
      return "Phone Number Must Be Greater than 11";
    }
    return null;
  }

  static String? passwordVaildtor(
    String? vlaue, {
    bool lengthValidation = true,
  }) {
    if (vlaue!.isEmpty) {
      "Please Enter Your Password ";
    }
    if (lengthValidation && vlaue.length < 8) {
      return "Password Must be Greater Than 8 Chrachter";
    }
    return null;
  }

  static String? confirmPasswordVaildtor({String? password, String? value}) {
    if (value != password) {
      return "Password Must Be Similar ";
    }
    return null;
  }

  static String? displayNameValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return "User name must not be empty";
    }
    return null;
  }

  static String? companyNameValidator(String? companyName) {
    if (companyName == null || companyName.isEmpty) {
      return "Company name must not be empty";
    }
    return null;
  }

  static String? arDescriptionValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return "User name must not be empty";
    }
    return null;
  }
}
