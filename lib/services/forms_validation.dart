class CustomerFormValidator {
  /// Validates customer's name (required)
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  /// Validates customer's phone number (required and must be digits, 10-15 length)
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegExp = RegExp(r'^[0-9]{10,15}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  /// Validates CNIC (13 digits for Pakistan format, optional dashes allowed)
  static String? validateCNIC(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'CNIC is required';
    }
    final cnicRegExp = RegExp(r'^\d{5}-\d{7}-\d{1}$|^\d{13}$');
    if (!cnicRegExp.hasMatch(value)) {
      return 'Enter a valid CNIC';
    }
    return null;
  }

  /// Optional email validation (only validates if not empty)
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter email'; // Optional
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  /// Address validation (required)
  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  /// Installment plan or amount field (optional customization)
  static String? validateField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field is required';
    }
    return null;
  }
  //
  static String? validateInstalmentField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field is required';
    }
    final amount = double.tryParse(value);
    if (amount == null || amount <= 0) {
      return 'Enter a valid amount';
    }
    return null;
  }
  /// Validates password (minimum 6 characters)
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

}
