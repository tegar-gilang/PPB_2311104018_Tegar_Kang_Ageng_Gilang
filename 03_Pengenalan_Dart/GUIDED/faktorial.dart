import 'dart:io';

int faktorial(int angka) {
  int hasil = 1;

  for (int i = 1; i <= angka; i++) {
    hasil *= i;
  }
  return hasil;
}

void main() {
  int angka = 5, hasil = 0;

  angka = int.parse(stdin.readLineSync()!);
  hasil = faktorial(angka);

  print(hasil.toString());
}