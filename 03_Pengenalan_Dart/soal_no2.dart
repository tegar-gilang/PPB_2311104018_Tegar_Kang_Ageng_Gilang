// Source code
void main() {
  // Menggunakan perulangan for
  int jumlahFor = 0;
  for (int i = 1; i <= 10; i++) {
    jumlahFor += i;
  }
  print("Jumlah dengan for: $jumlahFor");

  // Menggunakan perulangan while
  int jumlahWhile = 0;
  int j = 1;
  while (j <= 10) {
    jumlahWhile += j;
    j++;
  }
  print("Jumlah dengan while: $jumlahWhile");
}
