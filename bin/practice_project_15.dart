import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  print('please choose your password type\n');
  String input = stdin.readLineSync()!.toLowerCase();
  passwordGenerator(input);
}

void sufflePassword(int strenth) {
  final random = Random.secure();

  List<int> inilist = List.generate(strenth, (_) => random.nextInt(255));
  List charList = base64UrlEncode(inilist).split('').toList();
  charList.shuffle();
  print('your password is: ${charList.join()}');
}

void passwordGenerator(String strenth) {
  if (strenth == 'weak') {
    sufflePassword(8);
  } else if (strenth == 'medium') {
    sufflePassword(12);
  } else if (strenth == 'strong') {
    sufflePassword(15);
  } else {
    print('Try again!');
  }
}
