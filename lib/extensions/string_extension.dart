extension StringExtension on String {
  // Method to check if a string is empty or contains only whitespace
  bool get isBlank {
    return trim().isEmpty;
  }

  // Method to check if a string is a valid email address
  bool get isEmail {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(this);
  }

  // Method to reverse the characters in a string
  String get reversed {
    return split('').reversed.join();
  }
}
