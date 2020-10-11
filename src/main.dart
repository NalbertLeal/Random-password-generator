import 'dart:math';

String randDigit() {
  var random = Random();
  return random.nextInt(10).toString();
}

String randCharLowerCase() {
  var random = Random();
  var randAscii = random.nextInt(25) + 97;
  return String.fromCharCode(randAscii);
}

String randCharUpperCase() {
  var random = Random();
  var randAscii = random.nextInt(25) + 65;
  return String.fromCharCode(randAscii);
}

void main(List<String> arguments) {
  var passwordSize = int.parse(arguments[0]);
  if (passwordSize < 8) {
    print('Error >\tPasswords with less than 8 characters are insecure.');
    return;
  }

  var includeLowerCases = !arguments.contains('--no-lowercase');
  var includeUpperCases = !arguments.contains('--no-uppercase');
  var includeDigits = !arguments.contains('--no-digits');

  var password = '';
  var random = Random();
  for (var i=0; i < passwordSize; i++) {
    var randomSelection = random.nextInt(3);
    
    if (includeLowerCases && randomSelection == 0) {
      password += randCharLowerCase();
    } else if (includeUpperCases && randomSelection == 1) {
      password += randCharUpperCase();
    } else if (includeDigits && randomSelection == 2) {
      password += randDigit();
    } else {
      password += '@';
    }
  }

  print('${password}');
}
