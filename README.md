# Flutter AutoRoute Example

## Deskripsi
Project ini merupakan contoh aplikasi Flutter sederhana menggunakan **AutoRoute v6** untuk routing dan navigasi antar halaman, serta **AuthGuard** untuk proteksi halaman tertentu.  
Fitur yang ada di project ini:

- HomeScreen menampilkan daftar produk.
- DetailScreen menampilkan detail produk berdasarkan ID dan nama.
- SecondScreen halaman tambahan untuk navigasi.
- GuardScreen halaman yang membutuhkan login untuk akses.
- AuthGuard menangani navigasi ke halaman yang membutuhkan autentikasi.

Project ini dibuat sebagai **tugas GitHub / latihan implementasi AutoRoute** di Flutter.

---

## Catatan Penting

Pada saat membuka project di **VS Code**, beberapa file yang berkaitan dengan AutoRoute kadang menampilkan **tanda merah**, yaitu:

- `app_routes.dart`
- `app_routes.gr.dart`

Hal ini terjadi karena:

- `app_routes.gr.dart` **adalah file yang di-generate secara otomatis** menggunakan `build_runner`.  
- Sebelum menjalankan perintah generate, VS Code tidak mengenali beberapa simbol seperti `PageInfo`, `builder`, atau `argsAs`, sehingga muncul tanda merah.  
- File ini **tidak boleh diedit manual**. Perubahan harus dilakukan di `app_routes.dart` atau di annotasi screen (`@RoutePage`) kemudian **jalankan build_runner**.

Untuk memperbaiki tanda merah:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
