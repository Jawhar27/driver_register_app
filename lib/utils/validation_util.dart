String? validateNIC(String? value) {
  RegExp regExp = RegExp(r'^[0-9]{9}[vVxX]?$');

  if (value == null || value.isEmpty) {
    return 'NIC is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Invalid NIC format';
  }
  return null;
}

String? validateName(String? value) {
  RegExp regExp = RegExp(r'^[a-zA-Z\s]+$');

  if (value == null || value.isEmpty) {
    return 'Name is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Name should only contain letters and spaces';
  }
  return null;
}

String? validateMobile(String? value) {
  RegExp regExp = RegExp(r'^[0-9]{10}$');

  if (value == null || value.isEmpty) {
    return 'Mobile number is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Invalid mobile number (10 digits required)';
  }
  return null;
}

String? validateEmail(String? value) {
  RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  if (value == null || value.isEmpty) {
    return 'Email is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Invalid email format';
  }
  return null;
}

String? validateAccountNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Account number cannot be empty';
  } else if (value.length < 10) {
    return 'Account number must be at least 10 digits';
  }
  return null;
}

String? validateNotEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field cannot be empty';
  }
  return null;
}
