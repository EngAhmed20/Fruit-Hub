import 'app_string.dart';

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return AppString.validateEmail; // Assuming this is your string for "Email is required"
  }

  // More robust email regex (still not perfect, but better)
  final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
   if(!emailRegex.hasMatch(value)) {
    return 'صيغة البريد الإلكتروني غير صحيحة'; // "Invalid email format"
  }

  return null; // Returns null if the email is valid
}
// Validate password (you already have this one)
String? validateCurrentPassword(String? value) {
  if (value == null || value.isEmpty) {
    return AppString.currentPassValidate;
  }
  return null;
}
String? validateNewPassword(String? value) {
  if (value == null || value.isEmpty) {
    return AppString.newPassValidate;
  }
  /*if (value.length < 8) {
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
  }*/

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
    return AppString.confirmPassValidate;
  }
  if (value != password) {
    return AppString.passNotMatch;
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
    return 'المحافظة مطلوبة';
  }
  return null;
}

// Validate floor number (address section)
String? validateFloorNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'تفاصيل الشقة او العمارة مطلوب';
  }
  // Check if it's a valid number (optional)
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