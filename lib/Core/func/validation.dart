class AppValidation {
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
}
