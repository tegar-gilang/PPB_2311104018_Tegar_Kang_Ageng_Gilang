import 'dart:io';

void main() {
  // Meminta input dari user
  stdout.write("Masukkan sebuah bilangan bulat: ");
  int? angka = int.parse(stdin.readLineSync()!);

  // Mengecek apakah bilangan prima
  if (isPrima(angka)) {
    print("bilangan prima");
  } else {
    print("bukan bilangan prima");
  }
}

// Fungsi untuk mengecek bilangan prima
bool isPrima(int n) {
  if (n <= 1) return false; // bilangan <=1 bukan prima
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}
