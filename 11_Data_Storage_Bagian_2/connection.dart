import 'package:supabase_flutter/supabase_flutter.dart';

void Connection() async {
  await Supabase.initialize(
    url: "https://sozgnocklidlqxeuiorw.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNvemdub2NrbGlkbHF4ZXVpb3J3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI5MDgxNTIsImV4cCI6MjA3ODQ4NDE1Mn0.lebtojPjQQcgHSTCA-J2FnVtAkPmyMGfp-UQSn2E8aI",
    );
}

final db = Supabase.instance.client;
String table = "perpustakaan";

Future<void> insertData(Map<String, dynamic> row) async {
  try {
    await db.from(table).insert(row);

    print("data berhasil terkirim");
  } catch (e) {
    print(e.toString());
  }
}

Future<List> getData() async {
  final fetchData = await db.from(table).select();
  print(fetchData.toList().toString());

  return fetchData;
}

Future<void> updateData(Map<String, dynamic> row) async {
  try {
    await db.from(table).update(row).eq("id", row["id"]);

    print("Update data ${row["id"]} berhasil");
  } catch (e) {
    print(e.toString());
  }
}

Future<void> deleteData(String id) async {
  try {
    await db.from(table).delete().eq("id", id);

    print("Hapus data $id berhasil");
  } catch (e) {
    print(e.toString());
  }
}