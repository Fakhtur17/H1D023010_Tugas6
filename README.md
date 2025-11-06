Nama       : Ramadhan Fakhtur Rakhman 

NIM        : H1D023010


<img width="500" height="908" alt="image" src="https://github.com/user-attachments/assets/01232d0d-b640-4bf0-9ed9-d6bc0148876a" />

<img width="515" height="903" alt="image" src="https://github.com/user-attachments/assets/5bd18c92-3691-499f-b303-06f3b2fa388a" />

Siap 🙌 — berikut versi **penjelasan lengkap dalam bentuk paragraf utuh** (tanpa poin-poin atau tabel), ditulis dengan gaya bahasa formal seperti yang biasa digunakan dalam laporan tugas kuliah.
Semua isi sudah disesuaikan **dengan codinganmu di proyek NIM_Tugas6** yang memakai constructor-based navigation.

---

## 🧾 **Penjelasan Proses Passing Data dari Form Menuju Tampilan**

Proses **passing data** pada proyek *Flutter* bernama **NIM_Tugas6** dilakukan menggunakan pendekatan **constructor antar kelas (constructor-based data passing)**. Pendekatan ini berarti data yang diinputkan oleh pengguna pada halaman form dikirim ke halaman tujuan melalui parameter konstruktor saat proses navigasi terjadi. Metode ini merupakan cara paling sederhana dan aman secara tipe data karena setiap variabel yang dikirim memiliki tipe yang sudah jelas sejak tahap kompilasi, sehingga meminimalkan potensi terjadinya kesalahan saat program dijalankan.

Aplikasi ini terdiri dari dua halaman utama, yaitu halaman **FormDataPage** yang berfungsi sebagai tempat pengguna menginput data diri, dan halaman **TampilDataPage** yang berfungsi menampilkan hasil data yang sudah diinput. Halaman pertama (`FormDataPage`) berada di file `lib/ui/form_data.dart`, sedangkan halaman kedua (`TampilDataPage`) berada di file `lib/ui/tampil_data.dart`. Keduanya dihubungkan melalui file `main.dart`, yang bertugas memanggil tampilan awal aplikasi menggunakan `runApp()` dan menerapkan tema tampilan (*AppBar* berwarna biru serta *TextField* bergaya underline).

Pada halaman form, pengguna diminta untuk mengisi tiga data utama, yaitu **Nama**, **NIM**, dan **Tahun Lahir**. Ketiga isian tersebut dikontrol menggunakan tiga buah objek `TextEditingController`, yaitu `_namaC`, `_nimC`, dan `_tahunLahirC`. Controller ini bertugas untuk menangkap dan menyimpan teks yang diketik oleh pengguna agar bisa diakses kembali saat tombol **Simpan** ditekan. Semua input berada di dalam satu widget `Form` yang dikontrol oleh `GlobalKey<FormState>()` sehingga memungkinkan proses validasi input dilakukan sebelum data dikirim. Validasi ini memastikan bahwa seluruh field tidak boleh kosong, serta tahun lahir harus berupa angka dan berada dalam rentang yang logis (antara 1900 hingga tahun saat ini).

Ketika pengguna menekan tombol **Simpan**, maka fungsi `_submit()` dipanggil. Di dalam fungsi ini, sistem terlebih dahulu memeriksa apakah form valid melalui pemanggilan `if (!_formKey.currentState!.validate()) return;`. Jika validasi berhasil, maka data diambil dari masing-masing controller dan diproses lebih lanjut. Data `nama` dan `nim` diambil dalam bentuk `String`, sedangkan data `tahunLahir` dikonversi menjadi `int`. Selanjutnya, dilakukan perhitungan umur menggunakan rumus `umur = tahunSekarang - tahunLahir`, di mana `tahunSekarang` didapat dari `DateTime.now().year`. Dengan demikian, nilai umur dihitung secara otomatis sesuai dengan tahun berjalan tanpa perlu diinput secara manual oleh pengguna.

Setelah data siap, tahap berikutnya adalah **mengirimkan data ke halaman tampilan hasil**. Proses ini menggunakan widget `Navigator` dengan metode `push()` dan `MaterialPageRoute` untuk berpindah dari halaman form ke halaman tampil. Di dalam `MaterialPageRoute`, objek `TampilDataPage` dipanggil dengan membawa empat data hasil input, yaitu `nama`, `nim`, `tahunLahir`, dan `umur`. Kode yang digunakan adalah sebagai berikut:

<img width="883" height="402" alt="image" src="https://github.com/user-attachments/assets/092c964b-29b9-4a80-a52e-92cfe8f2d0d5" />


Potongan kode di atas merupakan inti dari proses **passing data antar halaman**. Data dikirim bersamaan dengan pembuatan halaman baru melalui konstruktor kelas `TampilDataPage`. Dengan metode ini, data dikirim langsung ke dalam parameter konstruktor tanpa perlu perantara seperti `arguments` atau *state management* tambahan. Pendekatan ini disebut **constructor-based navigation**, yang umumnya digunakan pada aplikasi sederhana atau tahap awal pembelajaran Flutter.

Pada sisi penerima, yaitu file `tampil_data.dart`, kelas `TampilDataPage` dideklarasikan sebagai `StatelessWidget` yang memiliki empat properti: `nama`, `nim`, `tahunLahir`, dan `umur`. Keempat properti ini bertipe data tetap (`String` dan `int`) dan diberi penanda `required` agar wajib diisi ketika halaman dipanggil. Data yang diterima melalui konstruktor kemudian langsung digunakan di dalam metode `build()` untuk menampilkan teks hasil input. Tampilan tersebut diatur menggunakan widget `Text` yang menampilkan kalimat seperti *“Nama saya [nama], NIM [nim], dan umur saya adalah [umur] tahun”*. Dengan cara ini, data yang dimasukkan pengguna pada halaman form dapat langsung terlihat dalam bentuk kalimat perkenalan pada halaman selanjutnya.

Secara keseluruhan, alur data dalam aplikasi ini dimulai dari pengisian form oleh pengguna, kemudian data tersebut diambil oleh controller dan divalidasi. Setelah validasi berhasil, aplikasi menghitung umur berdasarkan tahun lahir, lalu menavigasikan pengguna ke halaman `TampilDataPage` sambil membawa semua data tersebut melalui konstruktor. Di halaman tujuan, data diterima dan langsung ditampilkan dalam bentuk teks. Dengan demikian, terjadi proses **pertukaran data satu arah** dari halaman form ke halaman tampil secara aman dan efisien.

Metode constructor passing yang digunakan dalam proyek ini memiliki beberapa keunggulan. Pertama, **aman secara tipe data**, karena semua variabel yang dikirim dan diterima sudah memiliki tipe yang ditentukan dengan jelas. Kedua, **mudah dipahami dan diimplementasikan**, karena tidak memerlukan dependensi eksternal seperti `Provider`, `GetX`, atau `Bloc`. Ketiga, **lebih efisien untuk aplikasi sederhana**, terutama untuk tugas perkuliahan atau latihan dasar navigasi Flutter. Selain itu, karena data dikirim langsung melalui parameter konstruktor, kemungkinan terjadinya kesalahan referensi data sangat kecil.

Dengan penjelasan tersebut, dapat disimpulkan bahwa proyek **NIM_Tugas6** berhasil menerapkan konsep **passing data antar halaman menggunakan constructor** dengan baik. Data dari form diambil, diproses, dan dikirim menuju halaman tampilan secara terstruktur, aman, dan mudah dipahami. Pendekatan ini mencerminkan pemahaman dasar yang kuat terhadap konsep *widget hierarchy*, navigasi, dan manajemen data di Flutter.

