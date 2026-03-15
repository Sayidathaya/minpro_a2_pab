# 🎬 CineScope – Film Review App

<div align="center">
  
  ![Flutter](https://img.shields.io/badge/Flutter-3.10.8-blue?logo=flutter)
  ![Supabase](https://img.shields.io/badge/Supabase-2.5.6-green?logo=supabase)
  ![Dart](https://img.shields.io/badge/Dart-3.10.8-blue?logo=dart)
  ![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-red)
  ![License](https://img.shields.io/badge/License-MIT-yellow)

  **✨ Aplikasi Review Film dengan Flutter & Supabase ✨**
  
  [📱 Fitur](#-fitur-aplikasi) • 
  [🧩 Widget](#-widget-yang-digunakan) • 
  [🚀 Instalasi](#-instalasi-dan-konfigurasi) • 
  [📖 Penggunaan](#-cara-penggunaan-aplikasi) • 
  [🗄️ Database](#%EF%B8%8F-struktur-database-supabase)
  
</div>

---

## 📝 Deskripsi Aplikasi

**CineScope** adalah aplikasi mobile berbasis Flutter yang memungkinkan pengguna untuk menulis, menyimpan, dan mengelola review film favorit mereka. Aplikasi ini terintegrasi dengan **Supabase** sebagai backend-as-a-service yang menyediakan autentikasi dan database real-time.

### 🌟 Kenapa CineScope?

| Keunggulan | Deskripsi |
|------------|-----------|
| 🚀 **Ringan & Cepat** | Dibangun dengan Flutter untuk performa optimal |
| 🔐 **Aman** | Autentikasi dengan Supabase, data pribadi terproteksi |
| 🌓 **Fleksibel** | Dukungan Light & Dark Mode |
| 📱 **Responsif** | Tampilan menyesuaikan berbagai ukuran layar |
| 🎯 **Fokus** | UI sederhana dan mudah digunakan |

---

## 🎯 Fitur Aplikasi

### 1. 🔑 **Autentikasi Pengguna**
| Fitur | Keterangan |
|-------|------------|
| ✅ Registrasi Akun | Daftar dengan email dan password |
| ✅ Login | Masuk ke akun yang sudah terdaftar |
| ✅ Validasi Input | Password minimal 6 karakter, konfirmasi password |
| ✅ Proteksi Halaman | Hanya user login yang bisa mengakses review |
| ✅ Logout | Keluar dari aplikasi dengan aman |

### 2. 📝 **Manajemen Review Film (CRUD)**
| Operasi | Fitur |
|---------|-------|
| **Create** | Menambah review film baru dengan judul, rating (1-10), dan ulasan |
| **Read** | Menampilkan semua review milik user yang sedang login |
| **Update** | Mengedit review yang sudah ada |
| **Delete** | Menghapus review dengan konfirmasi |

### 3. 🎨 **Tampilan & Tema**
- **Light Mode** ☀️ - Tampilan cerah untuk siang hari
- **Dark Mode** 🌙 - Tampilan gelap untuk kenyamanan mata
- **Toggle Theme** 🔄 - Beralih tema dengan satu klik di AppBar

### 4. ⚡ **Fitur Tambahan**
- ✅ Sorting review berdasarkan waktu terbaru
- ✅ Validasi rating (hanya angka 1-10)
- ✅ Konfirmasi sebelum menghapus data
- ✅ Snackbar notification untuk setiap aksi
- ✅ Format waktu relatif ("2 hari yang lalu")
- ✅ Akun testing langsung tersedia

---

## 🧩 Widget yang Digunakan

### 📌 **Widget Struktural**
| Widget | Fungsi |
|--------|--------|
| `MaterialApp` | Root aplikasi dengan konfigurasi tema dan navigasi |
| `Scaffold` | Struktur dasar setiap halaman |
| `AppBar` | Bar atas dengan judul dan tombol aksi |
| `SafeArea` | Menghindari area notch/status bar |

### 📝 **Widget Input & Form**
| Widget | Fungsi |
|--------|--------|
| `TextField` | Input email, password, judul, rating, review |
| `TextFormField` | Input dengan validasi (alternatif) |
| `ElevatedButton` | Tombol aksi utama (Login, Register, Simpan) |
| `TextButton` | Tombol sekunder (Batal, Link ke halaman lain) |
| `IconButton` | Tombol dengan ikon (Toggle theme, Logout, Edit, Hapus) |

### 🎨 **Widget Layout**
| Widget | Fungsi |
|--------|--------|
| `Column` | Menyusun widget secara vertikal |
| `Row` | Menyusun widget secara horizontal |
| `Padding` | Memberi jarak dalam (internal padding) |
| `SizedBox` | Memberi jarak antar widget |
| `Expanded` | Mengisi ruang yang tersedia |
| `Center` | Memusatkan widget |
| `Container` | Membungkus widget dengan dekorasi |
| `Card` | Membungkus setiap item review dengan efek shadow |

### 📋 **Widget List & Scroll**
| Widget | Fungsi |
|--------|--------|
| `ListView.builder` | Menampilkan list review secara dinamis (lazy loading) |
| `SingleChildScrollView` | Membuat halaman bisa di-scroll |
| `SafeArea` | Menghindari area notch |

### 🎯 **Widget Interaktif**
| Widget | Fungsi |
|--------|--------|
| `GestureDetector` | Mendeteksi sentuhan (untuk memilih akun dummy) |
| `InkWell` | Efek ripple saat disentuh |
| `FutureBuilder` | Menangani data async (alternatif) |
| `ChangeNotifierProvider` | State management untuk tema |
| `Consumer` | Mendengarkan perubahan tema |

### 💬 **Widget Feedback**
| Widget | Fungsi |
|--------|--------|
| `CircularProgressIndicator` | Indikator loading saat proses login/register/simpan |
| `SnackBar` | Notifikasi aksi berhasil/gagal |
| `AlertDialog` | Dialog konfirmasi hapus data |
| `Icon` | Ikon visual untuk memperjelas aksi |

### 🎭 **Widget Dekorasi**
| Widget | Fungsi |
|--------|--------|
| `BoxDecoration` | Dekorasi container (warna, border, borderRadius) |
| `Border` | Garis tepi |
| `BorderRadius` | Sudut melengkung |
| `BoxShadow` | Efek bayangan |

---

## 🚀 Instalasi dan Konfigurasi

### 📋 **Prasyarat**
- ✅ Flutter SDK (versi 3.10.8 atau lebih baru)
- ✅ Dart SDK (versi 3.10.8 atau lebih baru)
- ✅ Android Studio / VS Code dengan ekstensi Flutter
- ✅ Akun Supabase (gratis di [supabase.com](https://supabase.com))

### 📥 **Langkah Instalasi**

#### 1. Konfigurasi Supabase

Buat file `lib/core/supabase_config.dart`:

```dart
class SupabaseConfig {
  // Ganti dengan URL Supabase kamu
  static const String supabaseUrl = "https://xyzabc.supabase.co";

  // Ganti dengan Anon Public Key kamu
  static const String supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...";
}
```

#### 2. Setup Database di Supabase

Jalankan SQL query berikut di **SQL Editor** Supabase:

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

-- 2. Create indexes
CREATE INDEX IF NOT EXISTS idx_reviews_user_id ON public.reviews(user_id);
CREATE INDEX IF NOT EXISTS idx_reviews_created_at ON public.reviews(created_at DESC);

-- 3. Enable RLS
ALTER TABLE public.reviews ENABLE ROW LEVEL SECURITY;

-- 4. Create policies
CREATE POLICY "Users can view their own reviews" 
ON public.reviews FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own reviews" 
ON public.reviews FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own reviews" 
ON public.reviews FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own reviews" 
ON public.reviews FOR DELETE USING (auth.uid() = user_id);

-- 5. Grant access
GRANT ALL ON public.reviews TO authenticated;
```

#### 3. Konfigurasi Autentikasi di Supabase

1. Buka **Supabase Dashboard** → **Authentication** → **Providers**
2. Klik **Email**
3. Set **Enable Sign Up** = ON
4. Set **Confirm Email** = OFF (untuk testing)
5. Klik **Save**

#### 4. Jalankan Aplikasi
```bash
flutter run
```

---

## 📖 Cara Penggunaan Aplikasi

### 🔐 **Login dengan Akun Testing**

Aplikasi sudah menyediakan 5 akun testing yang bisa langsung digunakan:

| No | Email | Password |
|----|-------|----------|
| 1 | user1@example.com | password123 |
| 2 | user2@example.com | password123 |
| 3 | user3@example.com | password123 |
| 4 | test@example.com | password123 |
| 5 | demo@example.com | password123 |

**Cara login:**
1. Buka aplikasi CineScope
2. Klik salah satu akun testing di panel **"Akun Testing Tersedia"**
3. Email dan password akan terisi otomatis
4. Klik tombol **"Login"**

### 📝 **Registrasi Akun Baru**

1. Di halaman login, klik **"Register"**
2. Isi form pendaftaran:
   - **Email**: contoh@email.com
   - **Password**: minimal 6 karakter
   - **Konfirmasi Password**: sama dengan password
3. Klik **"Register"**
4. Akan muncul notifikasi sukses
5. Kembali ke halaman login
6. Login dengan akun yang baru dibuat

### ✍️ **Menambah Review Film**

1. Setelah login, klik tombol **➕** (Floating Action Button) di pojok kanan bawah
2. Isi form review:
   - **Judul Film** (wajib)
   - **Rating** (angka 1-10, wajib)
   - **Review** (ulasan, wajib)
3. Klik tombol **"Simpan"**
4. Review akan langsung muncul di halaman utama

### 📋 **Melihat Daftar Review**

- Semua review ditampilkan dalam bentuk **Card** di halaman utama
- Setiap card menampilkan:
  - 🎬 **Judul Film** (dengan font tebal)
  - ⭐ **Rating** (format: angka/10)
  - 💬 **Review** (maksimal 3 baris)
  - 🕒 **Waktu** (format relatif: "2 hari yang lalu")
  - ✏️ **Tombol Edit** (warna biru)
  - 🗑️ **Tombol Hapus** (warna merah)

### ✏️ **Mengedit Review**

1. Pada card review yang ingin diedit, klik tombol **Edit** (ikon pensil)
2. Ubah data yang diinginkan
3. Klik **"Simpan"**
4. Data akan otomatis terupdate

### 🗑️ **Menghapus Review**

1. Pada card review yang ingin dihapus, klik tombol **Hapus** (ikon tong sampah)
2. Akan muncul dialog konfirmasi
3. Klik **"Hapus"** untuk mengonfirmasi, atau **"Batal"** untuk membatalkan
4. Review akan terhapus dari database

### 🌓 **Mengganti Tema**

- Klik icon **🌙/☀️** di pojok kanan AppBar
- Tema akan berubah antara Light Mode dan Dark Mode
- Pengaturan tema akan tersimpan selama aplikasi berjalan

### 🚪 **Logout dari Aplikasi**

- Klik icon **🚪** (logout) di pojok kanan AppBar
- Akan kembali ke halaman login

---

## 🗄️ Struktur Database Supabase

### 📋 **Tabel: `reviews`**

| Kolom | Tipe Data | Keterangan |
|-------|-----------|------------|
| `id` | UUID | Primary Key, auto-generated |
| `title` | TEXT | Judul film (tidak boleh kosong) |
| `rating` | INTEGER | Rating 1-10 (dengan CHECK constraint) |
| `review` | TEXT | Isi review (tidak boleh kosong) |
| `user_id` | UUID | Foreign Key ke `auth.users(id)` |
| `created_at` | TIMESTAMPTZ | Waktu dibuat (default: NOW()) |
| `updated_at` | TIMESTAMPTZ | Waktu diupdate (auto-update) |

### 🔒 **Row Level Security (RLS) Policies**

| Policy | Deskripsi |
|--------|-----------|
| `SELECT` | User hanya bisa melihat review miliknya sendiri |
| `INSERT` | User hanya bisa insert review dengan user_id = auth.uid() |
| `UPDATE` | User hanya bisa update review miliknya sendiri |
| `DELETE` | User hanya bisa delete review miliknya sendiri |

### ⚡ **Indexes**

| Index | Fungsi |
|-------|--------|
| `idx_reviews_user_id` | Mempercepat query berdasarkan user_id |
| `idx_reviews_created_at` | Mempercepat sorting berdasarkan waktu |

### 🔄 **Trigger**

- **`update_reviews_updated_at`**: Otomatis mengupdate `updated_at` setiap kali ada perubahan data

---

## 📁 Struktur Proyek

```
lib/
├── main.dart                 # Entry point aplikasi
├── core/
│   ├── supabase_config.dart  # Konfigurasi Supabase (URL & API Key)
│   └── theme_provider.dart   # State management untuk tema
├── models/
│   └── review.dart           # Model data review
├── pages/
│   ├── auth/
│   │   ├── login_page.dart   # Halaman login dengan akun testing
│   │   └── register_page.dart # Halaman registrasi akun baru
│   ├── home_page.dart        # Halaman utama daftar review
│   └── review_form_page.dart # Halaman form tambah/edit review
├── services/
│   └── review_service.dart   # Service untuk operasi CRUD ke Supabase
└── widgets/
    └── review_card.dart      # Widget card untuk menampilkan review
```

---

## 🚦 Alur Aplikasi

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│   Halaman       │────▶│   Halaman       │────▶│   Halaman       │
│   Login         │     │   Register      │     │   Utama         │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                          │
                                                          ▼
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│   Halaman       │◀────│   Halaman       │◀────│   Tambah/       │
│   Utama         │     │   Form Review   │     │   Edit Review   │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

---

## 🎨 Screenshot Aplikasi & Supabase

<img width="1919" height="310" alt="Image" src="https://github.com/user-attachments/assets/d96be150-91fc-466a-b0f4-34690f429c8b" />

<img width="1919" height="484" alt="Image" src="https://github.com/user-attachments/assets/2082224d-b39b-4055-9a84-f8289821b6ab" />

<img width="1919" height="1017" alt="Image" src="https://github.com/user-attachments/assets/cfba923a-2089-41f9-87eb-6b7c098850b2" />

<img width="1919" height="1021" alt="Image" src="https://github.com/user-attachments/assets/4503e85d-74e6-482c-a954-cee2d43e193c" />

<img width="1919" height="1018" alt="Image" src="https://github.com/user-attachments/assets/d61427cb-add6-4992-abba-17381c1ac1b5" />

<img width="1919" height="1014" alt="Image" src="https://github.com/user-attachments/assets/6a2ee2c2-b487-4fa4-953b-3a161133a43d" />

<img width="1919" height="1015" alt="Image" src="https://github.com/user-attachments/assets/78c9d9fd-b430-4d46-b036-60f772bcbaa5" />

<img width="1919" height="1018" alt="Image" src="https://github.com/user-attachments/assets/71c7ff9d-f2db-4880-9c54-289efd99088b" />

<img width="1919" height="1004" alt="Image" src="https://github.com/user-attachments/assets/ed6d0f96-b2ac-4cbb-a8ed-6cd8eadc073a" />

<img width="1919" height="531" alt="Image" src="https://github.com/user-attachments/assets/0566bff7-235c-4420-942e-da68930754cc" />

<img width="1919" height="907" alt="Image" src="https://github.com/user-attachments/assets/90f14498-f1e2-42ae-8f5a-c3d4acd4fa5a" />

<img width="1919" height="909" alt="Image" src="https://github.com/user-attachments/assets/9a717338-d2a0-402b-b662-84ac9967505f" />

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  supabase_flutter: ^2.5.6     # Untuk koneksi ke Supabase
  provider: ^6.1.2              # Untuk state management tema
```

</div>
```
