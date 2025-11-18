# Tugas 9 Flutter

1. Mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON?

Model Dart diperlukan untuk memetakan data JSON ke objek yang strongly-typed, memungkinkan validasi tipe data secara otomatis. Tanpa model, kita harus menggunakan Map<String, dynamic> yang rentan terhadap error runtime jika struktur data berubah. Model Dart meningkatkan null-safety dengan memungkinkan penggunaan nullable types, maintainability dengan menyediakan struktur yang jelas dan mudah diubah, serta memudahkan serialisasi/deserialisasi JSON melalui factory methods seperti fromJson() dan toJson().

2. Apa fungsi package http dan CookieRequest dalam tugas ini?

Package http menyediakan fungsi dasar untuk melakukan HTTP requests seperti GET, POST, PUT, DELETE ke server. CookieRequest adalah wrapper dari package pbp_django_auth yang mengelola cookies secara otomatis untuk menjaga session autentikasi. Http digunakan untuk komunikasi dasar, sedangkan CookieRequest khusus untuk menjaga state login/logout di aplikasi Flutter yang terhubung dengan Django.

3. Jelaskan perbedaan peran http vs CookieRequest.

Http adalah package dasar untuk HTTP requests tanpa state management, cocok untuk API calls sederhana. CookieRequest mengextend http dengan menambahkan cookie management untuk autentikasi persistent, memungkinkan session yang bertahan selama aplikasi berjalan. Http cocok untuk public APIs, CookieRequest untuk aplikasi dengan autentikasi berbasis session.

4. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest perlu dibagikan karena menjaga state autentikasi global di seluruh aplikasi. Dengan menggunakan Provider, semua komponen dapat mengakses instance yang sama, memastikan session login/logout konsisten. Tanpa sharing, setiap komponen akan membuat instance baru dan kehilangan state autentikasi.

5. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django.

Untuk konektivitas Flutter-Django, perlu menambahkan 10.0.2.2 ke ALLOWED_HOSTS di Django settings karena Android emulator menggunakan IP tersebut untuk mengakses localhost. CORS harus diaktifkan dengan django-cors-headers dan CORS_ALLOW_ALL_ORIGINS = True agar Flutter dapat mengirim requests. CSRF_TRUSTED_ORIGINS perlu diset untuk domain deployment. SameSite cookies harus None dengan CSRF_COOKIE_SAMESITE dan SESSION_COOKIE_SAMESITE = 'None', serta CSRF_COOKIE_SECURE dan SESSION_COOKIE_SECURE = True untuk HTTPS. Di Android manifest, perlu menambahkan android.permission.INTERNET untuk akses jaringan.

6. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Data dikirim dari Flutter melalui form input yang divalidasi, kemudian dikirim via CookieRequest.postJson() ke endpoint Django create_product_flutter. Django memproses data dengan validasi dan menyimpan ke database, mengembalikan response JSON. Flutter menerima response dan menampilkan SnackBar sukses/error, kemudian navigasi ke halaman utama. Untuk menampilkan, Flutter fetch data via GET request ke endpoint JSON, parse response ke List<ProductEntry>, dan render dalam ListView dengan ProductEntryCard.

7. Jelaskan mekanisme autentikasi dari login, register, hingga logout.

Login: User input username/password di Flutter, dikirim ke Django auth/login via CookieRequest.login(). Django authenticate user, set session cookies jika valid, return success response. Flutter simpan cookies via CookieRequest, navigasi ke home jika berhasil.

Register: User input credentials di Flutter, dikirim ke Django auth/register via postJson(). Django buat user baru jika valid, return success. Flutter tampilkan pesan dan navigasi ke login.

Logout: Flutter panggil CookieRequest logout atau Django auth/logout, Django clear session dan delete cookies. Flutter clear local state dan navigasi ke login.

8. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!

- Persiapan Model dan Form: Buat ProductEntry model Dart dengan fields sesuai Django Product model (name, price, description, category, thumbnail, is_featured, brand, weight). Update form Flutter untuk match fields Django, termasuk dropdown categories yang sesuai ('racket', 'shoes', 'accesories', 'bags', 'balls').

- Setup Autentikasi: Implement login/register/logout screens menggunakan CookieRequest dari pbp_django_auth. Provider wrap MaterialApp untuk share CookieRequest instance ke semua komponen.

- Konfigurasi Django: Update settings.py dengan ALLOWED_HOSTS=['10.0.2.2'], CORS_ALLOW_ALL_ORIGINS=True, CSRF_TRUSTED_ORIGINS untuk domain, SameSite='None' dan secure cookies. Install django-cors-headers.

- Implementasi API Calls: Buat create_product_flutter view di Django untuk handle POST JSON dari Flutter, validasi dan save Product dengan user dari request.user. Update Flutter form untuk post ke endpoint tersebut dengan semua required fields.

- UI/UX Matching: Update Flutter theme ke dark mode dengan colors matching Django CSS (--bg: #0f172a, --accent: #38bdf8, dll). Update semua screens untuk konsisten dark theme, remove hardcoded colors.

- Testing dan Integration**: Test pada Chrome Emulator, verify login/logout, create product, product list, product detail. Ensure all features work dengan Django backend.

---

# Tugas 8 Flutter

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() menambahkan halaman baru ke stack navigasi, sehingga pengguna dapat kembali ke halaman sebelumnya dengan tombol back. Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru, menghapus halaman sebelumnya dari stack, sehingga pengguna tidak dapat kembali.

Pada aplikasi Football Shop, Navigator.push() digunakan saat navigasi ke product detail dari product list, karena pengguna mungkin ingin kembali ke list. Navigator.pushReplacement() digunakan di drawer untuk navigasi antar halaman utama, karena drawer biasanya menggantikan halaman saat ini tanpa perlu kembali.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Scaffold menyediakan struktur dasar halaman dengan AppBar di atas, body di tengah, dan drawer di samping. AppBar menampilkan judul halaman dengan tema konsisten. Drawer menyediakan navigasi lateral dengan opsi seperti Home, Create Product, dan Product List. Dengan menggunakan Scaffold di setiap halaman, struktur aplikasi menjadi konsisten, memudahkan pengguna berpindah antar halaman.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Padding menambahkan ruang di sekitar widget untuk menghindari elemen terlalu rapat. SingleChildScrollView memungkinkan konten scrollable jika melebihi tinggi layar, mencegah overflow. ListView menyusun elemen dalam daftar scrollable, cocok untuk banyak item.

Dalam aplikasi Football Shop, Padding digunakan di sekitar form fields untuk memberikan margin. SingleChildScrollView membungkus Column di form create product untuk scroll jika form panjang. ListView digunakan di product list untuk menampilkan daftar produk yang dapat di-scroll.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Untuk menyesuaikan warna tema, saya menggunakan ThemeData di MaterialApp dengan dark theme dan custom ColorScheme menggunakan warna dari Django CSS (--bg: #0f172a, --accent: #38bdf8, dll). Ini memberikan konsistensi visual dengan brand toko sepakbola. AppBar menggunakan tema global, dan widget seperti ElevatedButton menggunakan primary color dari theme. InputDecorationTheme memastikan form fields konsisten dengan dark theme.

---

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
- Hot Restart: Memulai ulang aplikasi dari awal, termasuk menghapus state. Digunakan untuk perubahan struktural yang signifikan.

Hot reload lebih cepat untuk memperbarui UI, sedangkan hot restart digunakan untuk perubahan struktural yang signifikan.

