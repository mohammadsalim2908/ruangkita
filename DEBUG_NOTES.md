## Kasus 1 - RenderFlex Overflow pada Card

### Gejala
Pada pengujian viewport 360 x 800, card dengan nama kegiatan yang panjang menyebabkan isi Row melebihi ruang horizontal yang tersedia dan muncul masalah RenderFlex overflow.

### Screenshot sebelum
```text
screenshots/debug_overflow_before.png
```

### Dugaan akar masalah
Text kegiatan berada langsung di dalam Row tanpa Expanded atau Flexible sehingga Text tidak mendapatkan batas ruang horizontal yang sesuai dari parent.

Kode awal menggunakan pola:

```dart
Row(
  children: [
    Icon(...),
    Text(session.activity),
  ],
)
```

### Perubahan kode
Text kemudian diletakkan di dalam Expanded dan diberi batas jumlah baris:

```dart
Expanded(
  child: Column(
    children: [
      Text(
        session.activity,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  ),
)
```

### Hasil sesudah perbaikan
Card tidak lagi menyebabkan overflow pada pengujian mobile dan teks panjang dipotong dengan ellipsis ketika ruang tidak cukup.

## Kasus 2 - Layout Tablet Belum Memanfaatkan Ruang

### Gejala
Pada pengujian viewport 720 x 1024, versi awal masih menggunakan satu kolom sehingga ruang horizontal tablet belum dimanfaatkan sesuai requirement.

### Screenshot sebelum
```text
screenshots/debug_responsive_before.png
```

### Dugaan akar masalah
Layout awal belum menentukan jumlah kolom berdasarkan lebar parent.

### Perubahan kode
Ditambahkan LayoutBuilder:

```dart
body: LayoutBuilder(
  builder: (context, constraints) {
    final width = constraints.maxWidth;

    int columns;

    if (width < 600) {
      columns = 1;
    } else if (width < 840) {
      columns = 2;
    } else {
      columns = 3;
    }
```

Kemudian GridView digunakan ketika jumlah kolom lebih dari satu.

### Hasil sesudah perbaikan
Viewport 720 x 1024 menampilkan dua kolom dan viewport 1024 x 800 menampilkan tiga kolom.

### Screenshot sesudah
```text
screenshots/debug_responsive_after.png
```
