import 'dart:io';

void main() {
  List<Map> Mahasiswa = [];
   
    Mahasiswa.add({
      "Nama": stdin.readLineSync(),
      "NIM": int.parse(stdin.readLineSync()!),
      "Kelas": stdin.readLineSync(),
    });

  print(Mahasiswa);
}