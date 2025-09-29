import 'dart:io';

void main() {
  // Meminta input dari user
  stdout.write("Masukkan nilai: ");
  int? nilai = int.parse(stdin.readLineSync()!);

  // Panggil fungsi cekNilai
  String hasil = cekNilai(nilai);

  // Tampilkan hasil
  if (hasil.isNotEmpty) {
    print("$nilai merupakan $hasil");
  } else {
    print("Nilai tidak valid");
  }
}

// Fungsi percabangan
String cekNilai(int n) {
  if (n > 70) {
    return "Nilai A";
  } else if (n > 40 && n <= 70) {
    return "Nilai B";
  } else if (n > 0 && n <= 40) {
    return "Nilai C";
  } else {
    return "";
  }
}
