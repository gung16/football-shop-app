# Tugas 7 Flutter

1. Apa itu widget tree di Flutter dan bagaimana hubungan parent-child bekerja antar widget?

Widget tree adalah struktur hierarki yang menunjukkan hubungan antar widget dalam aplikasi Flutter. Setiap widget dapat memiliki widget lain di dalamnya, membentuk hubungan parent (induk) dan child (anak). Parent mengontrol tata letak dan perilaku child, sementara child mengikuti aturan yang ditentukan oleh parent. Contohnya, Scaffold adalah parent dari Column, dan Column dapat menjadi parent dari widget seperti Text, Row, atau GridView.

2. Sebutkan widget yang digunakan dalam proyek ini dan jelaskan fungsinya.

Berikut adalah beberapa widget utama yang digunakan:
- MaterialApp: Root aplikasi yang menyediakan tema dan navigasi.
- Scaffold: Struktur dasar halaman yang mencakup AppBar dan Body.
- AppBar: Menampilkan judul di bagian atas layar.
- Column dan Row: Menyusun elemen secara vertikal dan horizontal.
- GridView: Menyusun elemen dalam bentuk grid.
- Card: Menampilkan informasi dalam format kartu.
- Icon dan Text: Menampilkan ikon dan teks.
- InkWell: Menambahkan efek dan aksi saat elemen ditekan.
- SnackBar: Menampilkan pesan sementara di bagian bawah layar.

3. Apa fungsi widget MaterialApp?

MaterialApp adalah widget utama yang digunakan untuk membangun aplikasi dengan Material Design. Widget ini mengatur tema, navigasi, judul, dan struktur visual aplikasi. Sebagian besar aplikasi Flutter menggunakan MaterialApp sebagai root untuk kemudahan dan konsistensi.

4. Apa perbedaan antara StatelessWidget dan StatefulWidget?

- StatelessWidget: Tidak dapat berubah setelah dibuat. Cocok untuk elemen statis seperti teks, ikon, atau layout sederhana.
- StatefulWidget: Dapat berubah berdasarkan interaksi pengguna atau data baru. Cocok untuk elemen dinamis seperti form, tombol interaktif, atau data dari API.

Dalam proyek ini, MyHomePage menggunakan StatelessWidget karena tampilannya tetap sama selama aplikasi berjalan.

5. Apa itu BuildContext dan mengapa penting di Flutter?

BuildContext adalah objek yang menyimpan informasi tentang posisi widget dalam widget tree. BuildContext penting karena memungkinkan akses ke tema, navigasi, atau Scaffold terdekat dalam hierarki widget. Contohnya, ScaffoldMessenger.of(context) digunakan untuk menampilkan SnackBar berdasarkan konteks yang sesuai.

6. Apa itu "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart"?

- Hot Reload: Memperbarui kode dan tampilan aplikasi tanpa menghapus state (data dan posisi tetap sama). Cocok untuk perubahan kecil seperti warna, teks, atau layout.
- Hot Restart: Memulai ulang aplikasi dari awal, termasuk menghapus state. Digunakan untuk perubahan besar yang memengaruhi logika utama aplikasi.

Hot reload lebih cepat untuk memperbarui UI, sedangkan hot restart digunakan untuk perubahan struktural yang signifikan.
