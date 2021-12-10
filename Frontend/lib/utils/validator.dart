class Validator {
  static String? checkEmptyField(String? fieldContent) {
    if (fieldContent == null || fieldContent.isEmpty) {
      return 'Fields cannot be empty!';
    }
    return null;
  }
}
