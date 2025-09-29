import 'dart:io';

void main() {
  int n;

  n = int.parse(stdin.readLineSync()!);
  print(n);

  if (n > 0 && n < 10) {
    print(true);
  } else {
    print(false);
  }
}
