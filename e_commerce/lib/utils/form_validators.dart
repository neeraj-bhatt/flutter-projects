class FormValidator{
  static String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegex.hasMatch(value)){
      return 'Enter a valid Email';
    }
    // if valid
    return null;
  }

  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return 'Password is required';
    }
    if(value.length < 8){
      return 'Password must be at least 8 characters';
    }
    // if valid
    return null;
  }

  static String? validatePhoneNumber(String? value){
    if(value == null || value.isEmpty){
      return 'Phone Number is required';
    }
    final phoneRegex = RegExp(r'^\d{10}$');
    if(!phoneRegex.hasMatch(value)){
      return 'Enter a valid 10-digit phone number';
    }
    // if valid
    return null;
  }

  static String? validateName(String? value){
    if(value == null || value.isEmpty){
      return 'Name is required';
    }
    final nameRegex = RegExp(r"^[a-zA-Z\s'-]+$");
    if(!nameRegex.hasMatch(value.trim())){
      return 'Enter a Valid Name';
    }
    // if valid
    return null;
  }
}