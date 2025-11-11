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

# Tugas 8 Flutter

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() menambahkan halaman baru ke stack navigasi, sehingga pengguna dapat kembali ke halaman sebelumnya dengan tombol back. Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru, menghapus halaman sebelumnya dari stack, sehingga pengguna tidak dapat kembali.

Pada aplikasi Football Shop, Navigator.push() digunakan saat menekan tombol "Add Product" dari halaman utama untuk membuka form tambah produk, karena pengguna mungkin ingin kembali ke halaman utama setelah selesai. Navigator.pushReplacement() digunakan di drawer untuk navigasi ke halaman utama atau form tambah produk, karena drawer biasanya menggantikan halaman saat ini tanpa perlu kembali.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Scaffold menyediakan struktur dasar halaman dengan AppBar di atas, body di tengah, dan drawer di samping. AppBar menampilkan judul halaman dan warna konsisten. Drawer menyediakan navigasi lateral dengan opsi seperti Home dan Add Product. Dengan menggunakan Scaffold di setiap halaman, struktur aplikasi menjadi konsisten, memudahkan pengguna berpindah antar halaman.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Padding menambahkan ruang di sekitar widget untuk menghindari elemen terlalu rapat. SingleChildScrollView memungkinkan konten scrollable jika melebihi tinggi layar, mencegah overflow. ListView menyusun elemen dalam daftar scrollable, cocok untuk banyak item.

Dalam aplikasi Football Shop, Padding digunakan di sekitar TextFormField untuk memberikan margin. SingleChildScrollView membungkus Column di form untuk scroll jika form panjang. ListView digunakan di drawer untuk daftar opsi navigasi.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Untuk menyesuaikan warna tema, saya menggunakan ThemeData di MaterialApp dengan ColorScheme.fromSwatch(primarySwatch: Colors.blue) dan secondary: Colors.blueAccent[400]. Ini memberikan warna biru sebagai primary dan biru accent sebagai secondary, menciptakan konsistensi visual dengan brand toko sepakbola. AppBar menggunakan primary color, dan widget seperti ElevatedButton di form menggunakan primary color untuk tombol. Untuk tombol di homepage, saya menyesuaikan warna spesifik: biru untuk "All Products", hijau untuk "My Products", dan merah untuk "Create Product" menggunakan metode _getButtonColor() di ItemCard. Selain itu untuk forms saya menggunakan warna indigo agar membedakannya dengan homepage.

