class RegexTypes {
  RegexTypes._();

  static const String email = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String password = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
  static const String phoneNumber = r'^\d{10}$';
  static const String name = r"^[a-zA-Z]+(([', r'-][a-zA-Z ])?[a-zA-Z]*)*$";
  static const String username = r'^[a-zA-Z0-9]{3,}$';
  static const String date = r'^\d{4}-\d{2}-\d{2}$';
  static const String time = r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$';
  static const String dateTime =
      r'^\d{4}-\d{2}-\d{2} ([01]?[0-9]|2[0-3]):[0-5][0-9]$';
  static const String url =
      r'^((http|https)://)?([a-zA-Z0-9]+[.])?[a-zA-Z0-9-]+[.][a-z]{2,}([/][a-zA-Z0-9#]+[/]?)?$';
  static const String hexColor = r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$';
  static const String ipv4 =
      r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';
  static const String ipv6 = r'^([0-9a-fA-F]{1,4}:){7}([0-9a-fA-F]{1,4})$';
  static const String macAddress = r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$';
  static const String creditCard = r'^\d{4}-\d{4}-\d{4}-\d{4}$';
  static const String alphaNumeric = r'^[a-zA-Z0-9]+$';
  static const String alphaNumericWithSpace = r'^[a-zA-Z0-9 ]+$';
  static const String alphaNumericWithSpecialCharacters =
      r'^[a-zA-Z0-9!@#\$&*]+$';
  static const String numeric = r'^[0-9]+$';
  static const String numericWithDot = r'^[0-9.]+$';
  static const String numericWithComma = r'^[0-9,]+$';
  static const String numericWithDotAndComma = r'^[0-9.,]+$';
  static const String numericWithDotCommaAndMinus = r'^-?[0-9.,]+$';
  static const String numericWithDotCommaMinusAndSpace = r'^-?[0-9., ]+$';
  static const String numericWithDotCommaMinusSpaceAndParentheses =
      r'^-?[0-9., ()]+$';
}
