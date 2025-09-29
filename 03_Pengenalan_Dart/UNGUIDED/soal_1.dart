import 'dart:io';

void main() {
  // Meminta input dari user
  stdout.write("Masukkan nilai: ");
  String? input = stdin.readLineSync();

  // Cek apakah input kosong atau null
  if (input == null || input.trim().isEmpty) {
    print("Input tidak boleh kosong!");
    return; // hentikan program
  }

  // Ubah ke integer
  int? nilai;
  try {
    nilai = int.parse(input);
  } catch (e) {
    print("Input harus berupa angka!");
    return;
  }

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
