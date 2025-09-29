import 'dart:io';

void main() {
  // Input panjang piramida dari user
  stdout.write("Masukkan panjang piramida: ");
  int n = int.parse(stdin.readLineSync()!);

  // Looping untuk membuat piramida
  for (int i = 1; i <= n; i++) {
    // Cetak spasi di depan
    for (int j = 1; j <= n - i; j++) {
      stdout.write(" ");
    }
    // Cetak bintang dengan spasi antar bintang
    for (int k = 1; k <= i; k++) {
      stdout.write("* ");
    }
    print(""); // Pindah baris
  }
}
