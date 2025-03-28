# Tutorial 7 Game Development - Basic 3D Game Mechanics & Level Design

## Fitur yang Diimplementasikan Pada Latihan Mandiri

### 1. Sprinting (Lari dengan Shift)
Pemain dapat berlari dengan menekan tombol **Shift**. Kecepatan karakter meningkat selama tombol ditekan. Mekanik ini diatur melalui variabel `sprint_speed` dan diaktifkan ketika input `sprint` terdeteksi.

### 2. Crouching (Jongkok dengan Control)
Pemain dapat berjalan lebih lambat sambil jongkok dengan menekan tombol **Control**. Selain kecepatan dikurangi, posisi kamera juga turun ke bawah secara halus untuk mensimulasikan efek crouch. Transisi ini diatur dengan `lerp()` agar smooth.

### 3. Jurang dan Restart Level
Ditambahkan area jurang di level. Jika pemain terjatuh, maka scene akan di-reload secara otomatis untuk me-reset posisi pemain (restart level).

### 5. End Goal & Win Screen
Terdapat zona tujuan (goal) yang ketika disentuh oleh pemain, akan memicu pergantian scene ke **WinScreen**. Sistem ini dibuat menggunakan `Area3D` dan deteksi `body_entered`.

### 6. Pick Up Item (Bola)
Ditambahkan item berupa bola yang dapat diambil oleh pemain. Sistem pickup dilakukan dengan:
- RayCast3D yang mendeteksi objek di depan kamera
- Sistem `Interactable` yang memanggil fungsi `interact()` pada item
Apabila player mengambil bola, maka akan ada visual seperti player mengambil bola. Bola tersebut akan ada di depan player dan bisa dibawa kemana-mana.

### 7. Polish Level & Visual
Level 1 ditingkatkan secara visual dengan menambahkan:
- Pencahayaan (OmniLight3D)
- Beberapa objek dekoratif, seperti lampu
- Tata letak ruangan yang lebih rapi dan menarik secara visual.
