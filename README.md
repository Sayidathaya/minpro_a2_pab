# 🎬 CineScope – Film Review App

<div align="center">
  
  ![Flutter](https://img.shields.io/badge/Flutter-3.10.8-blue?logo=flutter)
  ![Supabase](https://img.shields.io/badge/Supabase-2.5.6-green?logo=supabase)
  ![Dart](https://img.shields.io/badge/Dart-3.10.8-blue?logo=dart)
  ![License](https://img.shields.io/badge/License-MIT-yellow)

  **Aplikasi Review Film Modern dengan Flutter & Supabase** ✨
  
  [Fitur](#-fitur-aplikasi) • 
  [Instalasi](#-instalasi) • 
  [Penggunaan](#-cara-penggunaan) • 
  [Database](#-konfigurasi-supabase)
  
</div>

---

## 📱 Deskripsi Aplikasi

**CineScope** adalah aplikasi mobile berbasis Flutter yang memungkinkan pengguna untuk menulis, membaca, mengedit, dan menghapus review film. Aplikasi ini terintegrasi dengan **Supabase** sebagai backend-as-a-service untuk autentikasi dan database.

### ✨ Keunggulan Aplikasi:
- 🚀 **Real-time database** dengan Supabase
- 🔐 **Autentikasi aman** (Login/Register)
- 🌓 **Dark/Light mode** yang bisa di-toggle
- 📱 **UI modern** dengan Material Design
- 🔒 **Data pribadi** (setiap user hanya melihat reviewnya sendiri)

---

## 🎯 Fitur Aplikasi

### 1. **Autentikasi Pengguna** 🔑
- Registrasi akun baru dengan email & password
- Login ke akun yang sudah terdaftar
- Validasi input (password minimal 6 karakter, konfirmasi password)
- Proteksi halaman (hanya user login yang bisa mengakses review)

### 2. **Manajemen Review Film** 🎥
| Fitur | Keterangan |
|-------|------------|
| **Create** | Menambah review film baru (judul, rating 1-10, ulasan) |
| **Read** | Menampilkan semua review milik user yang login |
| **Update** | Mengedit review yang sudah ada |
| **Delete** | Menghapus review dengan konfirmasi |

### 3. **Tampilan & Tema** 🎨
- **Light Mode** 🌞 - Tampilan cerah untuk siang hari
- **Dark Mode** 🌙 - Tampilan gelap untuk kenyamanan mata
- **Toggle Theme** - Beralih tema dengan satu klik

### 4. **Fitur Tambahan** ⭐
- Sorting review berdasarkan waktu terbaru
- Validasi rating (hanya angka 1-10)
- Konfirmasi sebelum menghapus data
- Toast notification untuk setiap aksi
- Logout dari aplikasi

---

## 🧩 Widget yang Digunakan

### **Widget Struktural**
| Widget | Fungsi |
|--------|--------|
| `MaterialApp` | Root aplikasi dengan konfigurasi tema |
| `Scaffold` | Struktur dasar halaman |
| `AppBar` | Bar atas dengan judul dan aksi |
| `Body` | Konten utama halaman |

### **Widget Input & Form**
| Widget | Fungsi |
|--------|--------|
| `TextField` | Input email, password, judul, rating, review |
| `TextFormField` | Input dengan validasi |
| `ElevatedButton` | Tombol aksi utama |
| `TextButton` | Tombol sekunder |
| `IconButton` | Tombol dengan ikon |

### **Widget Layout**
| Widget | Fungsi |
|--------|--------|
| `Column` | Menyusun widget vertikal |
| `Row` | Menyusun widget horizontal |
| `Padding` | Memberi jarak dalam |
| `SizedBox` | Memberi jarak antar widget |
| `Expanded` | Mengisi ruang yang tersedia |
| `ListView.builder` | Menampilkan list review secara dinamis |
| `Card` | Membungkus setiap item review |

### **Widget Interaktif**
| Widget | Fungsi |
|--------|--------|
| `GestureDetector` | Mendeteksi sentuhan |
| `FutureBuilder` | Menangani data async |
| `ChangeNotifierProvider` | State management untuk tema |
| `Consumer` | Mendengarkan perubahan tema |
| `AlertDialog` | Konfirmasi hapus data |

### **Widget Feedback**
| Widget | Fungsi |
|--------|--------|
| `CircularProgressIndicator` | Indikator loading |
| `SnackBar` | Notifikasi aksi berhasil/gagal |
| `Icon` | Ikon visual untuk aksi |

---

## 📋 Prasyarat

Sebelum memulai, pastikan Anda telah menginstal:

- ✅ **Flutter SDK** (versi 3.10.8 atau lebih baru)
- ✅ **Dart SDK** (versi 3.10.8 atau lebih baru)
- ✅ **Android Studio** / **VS Code** dengan ekstensi Flutter
- ✅ **Git** untuk cloning repository
- ✅ **Akun Supabase** (gratis)

---

## 🚀 Instalasi

### 1. Clone Repository
```bash
git clone https://github.com/username/cinescope.git
cd cinescope
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Konfigurasi Supabase

Buat file `lib/core/supabase_config.dart`:

```dart
class SupabaseConfig {
  // Ganti dengan URL Supabase kamu
  static const String supabaseUrl = "https://xyzabcdefg.supabase.co";

  // Ganti dengan API Key kamu (anon public key)
  static const String supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...";
}
```

### 4. Setup Database di Supabase

Buka **SQL Editor** di dashboard Supabase dan jalankan query berikut:

```sql
-- 1. Create reviews table
CREATE TABLE IF NOT EXISTS public.reviews (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title TEXT NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 10),
    review TEXT NOT NULL,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- 2. Create index for better performance
CREATE INDEX IF NOT EXISTS idx_reviews_user_id ON public.reviews(user_id);
CREATE INDEX IF NOT EXISTS idx_reviews_created_at ON public.reviews(created_at DESC);

-- 3. Enable Row Level Security (RLS)
ALTER TABLE public.reviews ENABLE ROW LEVEL SECURITY;

-- 4. Create policies for CRUD operations
CREATE POLICY "Users can view their own reviews" 
ON public.reviews FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own reviews" 
ON public.reviews FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own reviews" 
ON public.reviews FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own reviews" 
ON public.reviews FOR DELETE USING (auth.uid() = user_id);

-- 5. Create function to automatically update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc'::text, NOW());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- 6. Create trigger to call the function on update
CREATE TRIGGER update_reviews_updated_at
    BEFORE UPDATE ON public.reviews
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- 7. Grant access to authenticated users
GRANT ALL ON public.reviews TO authenticated;

-- 8. Add comments
COMMENT ON TABLE public.reviews IS 'Table untuk menyimpan review film dari users';
COMMENT ON COLUMN public.reviews.id IS 'Unique identifier for each review';
COMMENT ON COLUMN public.reviews.title IS 'Judul film yang direview';
COMMENT ON COLUMN public.reviews.rating IS 'Rating film dari 1-10';
COMMENT ON COLUMN public.reviews.review IS 'Teks review film';
COMMENT ON COLUMN public.reviews.user_id IS 'ID user yang membuat review (references auth.users)';
COMMENT ON COLUMN public.reviews.created_at IS 'Timestamp when review was created';
COMMENT ON COLUMN public.reviews.updated_at IS 'Timestamp when review was last updated';
```

### 5. Jalankan Aplikasi
```bash
flutter run
```

---

## 📖 Cara Penggunaan

### **📝 Registrasi Akun**
1. Buka aplikasi CineScope
2. Klik "Belum punya akun? Register"
3. Isi form registrasi:
   - Email (valid)
   - Password (minimal 6 karakter)
   - Konfirmasi password
4. Klik tombol "Register"
5. Kembali ke halaman login

### **🔐 Login**
1. Masukkan email dan password yang sudah didaftarkan
2. Klik tombol "Login"
3. Akan diarahkan ke halaman utama

### **✍️ Menambah Review**
1. Di halaman utama, klik tombol **+** (Floating Action Button)
2. Isi form:
   - **Judul Film** (wajib)
   - **Rating** (angka 1-10, wajib)
   - **Review** (ulasan, wajib)
3. Klik tombol "Simpan"
4. Review akan muncul di halaman utama

### **📋 Melihat Review**
- Semua review ditampilkan dalam bentuk **Card** di halaman utama
- Setiap card menampilkan:
  - Judul film
  - Rating dengan icon bintang ⭐
  - Isi review
  - Tombol Edit ✏️ dan Hapus 🗑️
  - Waktu dibuat (contoh: "2 hari yang lalu")

### **✏️ Mengedit Review**
1. Pada card review yang ingin diedit, klik icon **Edit** (pensil)
2. Ubah data yang diinginkan
3. Klik "Simpan"
4. Data otomatis terupdate

### **🗑️ Menghapus Review**
1. Pada card review yang ingin dihapus, klik icon **Hapus** (tong sampah)
2. Konfirmasi penghapusan
3. Data akan terhapus dari database

### **🌓 Mengganti Tema**
- Klik icon **matahari/bulan** di pojok kanan AppBar
- Tema akan berubah antara Light/Dark mode

### **🚪 Logout**
- Klik icon **logout** di pojok kanan AppBar
- Akan kembali ke halaman login

---

## 📁 Struktur Proyek

```
lib/
├── main.dart                 # Entry point aplikasi
├── core/
│   ├── supabase_config.dart  # Konfigurasi Supabase
│   └── theme_provider.dart   # State management tema
├── models/
│   └── review.dart           # Model data review
├── pages/
│   ├── auth/
│   │   ├── login_page.dart   # Halaman login
│   │   └── register_page.dart # Halaman registrasi
│   ├── home_page.dart        # Halaman utama daftar review
│   └── review_form_page.dart # Halaman form tambah/edit review
├── services/
│   └── review_service.dart   # Service untuk operasi CRUD
└── widgets/
    └── review_card.dart      # Widget card untuk menampilkan review
```

---

## 🛠️ Teknologi yang Digunakan

| Teknologi | Versi | Kegunaan |
|-----------|-------|----------|
| **Flutter** | 3.10.8 | Framework UI utama |
| **Dart** | 3.10.8 | Bahasa pemrograman |
| **Supabase Flutter** | 2.5.6 | Backend & Autentikasi |
| **Provider** | 6.1.2 | State management |
| **Supabase PostgreSQL** | - | Database |

---

## 🔑 Environment Variables

```dart
// lib/core/supabase_config.dart
class SupabaseConfig {
  static const String supabaseUrl = "YOUR_SUPABASE_URL";
  static const String supabaseAnonKey = "YOUR_SUPABASE_ANON_KEY";
}
```

---

## 📊 Database Schema

### Tabel: `reviews`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | UUID | Primary Key |
| `title` | TEXT | Judul film |
| `rating` | INTEGER | Rating 1-10 |
| `review` | TEXT | Isi review |
| `user_id` | UUID | Foreign Key ke auth.users |
| `created_at` | TIMESTAMPTZ | Waktu dibuat |
| `updated_at` | TIMESTAMPTZ | Waktu diupdate |

---

## 🎨 Screenshot Aplikasi

```
📱 Halaman Login          📱 Halaman Register       📱 Halaman Utama
+----------------+        +----------------+        +----------------+
| [CineScope]    |        | [Register]     |        | CineScope ☀️🚪 |
|                |        |                |        |                |
| Email: _______ |        | Email: _______ |        | The Dark Knight|
| Pass:  _______ |        | Pass:  _______ |        | ⭐ 10/10       |
|                |        | Confirm: _____ |        | Film terbaik...|
| [Login]        |        |                |        | ✏️ 🗑️          |
|                |        | [Register]     |        |                |
| Register?      |        |                |        | Inception      |
+----------------+        +----------------+        | ⭐ 9/10        |
                                                     | Mind bending...|
                                                     | ✏️ 🗑️          |
                                                     |                |
                                                     |      [+]       |
                                                     +----------------+
```

---

## ❗ Troubleshooting

### **Error: "Relation reviews_id_seq does not exist"**
- **Solusi**: Gunakan query SQL yang sudah diperbaiki (menggunakan UUID)

### **Error: "User tidak terautentikasi"**
- **Solusi**: Pastikan sudah login sebelum mengakses halaman utama

### **Error: "Failed to load data"**
- **Solusi**: 
  1. Cek koneksi internet
  2. Verifikasi URL dan API Key Supabase
  3. Pastikan tabel sudah dibuat

### **Dark/Light mode tidak berfungsi**
- **Solusi**: Pastikan Provider sudah dibungkus di `main.dart`

</div>
```
