import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller untuk mengelola state counter menggunakan GetX
class CounterController extends GetxController {
  // 1) Variabel reaktif: RxInt (0.obs memberi Rx<int>)
  //    Keuntungan: perubahan auto-notify ke Obx widgets
  var counter = 0.obs;

  // 2) Fungsi untuk menambah nilai counter
  void increment() {
    // operator ++ di RxInt otomatis memodifikasi value
    counter++;
    // alternatif: counter.value = counter.value + 1;
  }

  // 3) Fungsi untuk mengurangi (opsional)
  void decrement() {
    if (counter.value > 0) counter--;
  }

  // 4) Fungsi untuk mereset nilai counter
  void reset() {
    counter.value = 0;
  }

  // Lifecycle hooks
  @override
  void onInit() {
    super.onInit();
    // contoh: inisialisasi data, subscribe ke service, atau fetch awal
    print("CounterController onInit - controller dibuat");
  }

  @override
  void onReady() {
    super.onReady();
    // siap setelah widget muncul di layar
    print("CounterController onReady - widget siap");
  }

  @override
  void onClose() {
    // disposal: tutup stream atau cleanup
    print("CounterController onClose - controller dihapus");
    super.onClose();
  }
}

class HomePage extends StatelessWidget {
  // Put controller ke dependency management GetX.
  // Get.put membuat instance langsung dan tersedia via Get.find()
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App (GetX)")),
      body: Center(
        // Obx mendengarkan perubahan pada Rx value di dalam closure
        child: Obx(() {
          // controller.counter.value berubah -> Obx rebuild
          return Text(
            "${controller.counter.value}",
            style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Tambah
          FloatingActionButton(
            heroTag: "add",
            onPressed: () {
              controller.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          // Kurangi
          FloatingActionButton(
            heroTag: "minus",
            onPressed: () {
              controller.decrement();
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 10),
          // Reset
          FloatingActionButton(
            heroTag: "reset",
            onPressed: () {
              // Contoh penggunaan dialog konfirmasi
              Get.defaultDialog(
                title: "Reset",
                middleText: "Reset counter ke 0?",
                onConfirm: () {
                  controller.reset();
                  Get.back(); // tutup dialog
                },
                onCancel: () {},
              );
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

void main() {
  // Untuk menggunakan Get features (snackbar, routing), gunakan GetMaterialApp
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
