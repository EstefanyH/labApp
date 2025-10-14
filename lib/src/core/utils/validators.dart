class Validators {
  
  static String? validateEmail(String? value){
    if (value == null || value.isEmpty) return 'El email es obligatorio';
    final regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if(!regex.hasMatch(value)) return 'Formato de email invalido';
    return null;
  }

  static String? validateUsername(String? value) {
    if(value == null || value.isEmpty) return 'El usuario es obligatprio';
    return null;
  }
}