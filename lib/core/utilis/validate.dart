import 'app_string.dart';

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return AppString.validateEmail;
  }

  final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  if (!emailRegex.hasMatch(value)) {
    return 'صيغة البريد الإلكتروني غير صحيحة';
  }

  return null;
}

// Validate password (you already have this one)
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'كلمة المرور مطلوبة';
  }
  if (value.length < 8) {
    return 'كلمة المرور يجب أن تحتوي على 8 أحرف على الأقل';
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل';
  }
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل';
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'كلمة المرور يجب أن تحتوي على رقم واحد على الأقل';
  }
  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return 'كلمة المرور يجب أن تحتوي على رمز خاص واحد على الأقل';
  }

  return null;
}

// Validate name (you already have this one)
String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'الاسم مطلوب';
  }

  final nameRegex = RegExp(r'^[a-zA-Z\u0621-\u064A\s]+$');
  if (!nameRegex.hasMatch(value)) {
    return 'الاسم يمكن أن يحتوي فقط على الأحرف والمسافات';
  }

  return null;
}

// Validate confirm password (you already have this one)
String? validateConfirmPassword(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return 'تأكيد كلمة المرور مطلوب';
  }
  if (value != password) {
    return 'كلمتا المرور غير متطابقتين';
  }
  return null;
}

// Validate address in Arabic
String? validateAddress(String? value) {
  if (value == null || value.isEmpty) {
    return 'العنوان مطلوب';
  }
  return null;
}

// Validate city in Arabic
String? validateCity(String? value) {
  if (value == null || value.isEmpty) {
    return 'المدينة مطلوبة';
  }
  return null;
}

// Validate floor number (address section)
String? validateFloorNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'رقم الطابق مطلوب';
  }
  // Check if it's a valid number (optional)
  final floorNumberRegex = RegExp(r'^[0-9]+$');
  if (!floorNumberRegex.hasMatch(value)) {
    return 'رقم الطابق يجب أن يكون رقمًا';
  }
  return null;
}
String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'رقم الهاتف مطلوب';
  }

  // Regex pattern for phone number validation (supports international and local formats)
  final phoneRegex = RegExp(r'^[+]?[0-9]{10,15}$');
  if (!phoneRegex.hasMatch(value)) {
    return 'رقم الهاتف غير صالح. يجب أن يحتوي على 10 إلى 15 رقمًا';
  }

  return null;
}