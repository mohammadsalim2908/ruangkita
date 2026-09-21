class RoomSession {
  const RoomSession({
    required this.roomName,
    required this.category,
    required this.activity,
    required this.time,
    required this.status,
    required this.description,
  });

  final String roomName;
  final String category;
  final String activity;
  final String time;
  final String status;
  final String description;
}

final List<RoomSession> roomSessions = [
  RoomSession(
    roomName: 'Ruang Rapat-01',
    category: 'Ruang Rapat',
    activity: 'Koordinasi pengembangan aplikasi akademik semester berjalan',
    time: '08.00 - 10.00',
    status: 'Berlangsung',
    description:
        'Ruang ini digunakan untuk koordinasi pengembangan aplikasi akademik semester berjalan, termasuk pembahasan pembagian tugas, target pengerjaan, dan evaluasi hasil implementasi setiap anggota tim.',
  ),
  RoomSession(
    roomName: 'Ruang Rapat-01',
    category: 'Ruang Rapat',
    activity: 'Presentasi evaluasi sprint tim mobile dan pembagian tugas lanjutan',
    time: '10.30 - 12.00',
    status: 'Akan Datang',
    description:
        'Tim mobile akan mempresentasikan hasil sprint kemudian membahas pekerjaan yang perlu dilanjutkan pada sesi berikutnya.',
  ),
  RoomSession(
    roomName: 'Ruang Rapat-02',
    category: 'Ruang Rapat',
    activity: 'Diskusi desain arsitektur aplikasi RuangKita',
    time: '13.00 - 14.00',
    status: 'Tersedia',
    description:
        'Ruang dapat digunakan untuk diskusi desain arsitektur, pembagian pekerjaan, dan penyusunan rencana implementasi fitur aplikasi.',
  ),
  RoomSession(
    roomName: 'Ruang Rapat-02',
    category: 'Ruang Rapat',
    activity: 'Review hasil pengujian fitur pemesanan ruang',
    time: '14.30 - 15.30',
    status: 'Selesai',
    description:
        'Sesi digunakan untuk meninjau hasil pengujian dan mencatat perbaikan yang diperlukan sebelum fitur digunakan lebih lanjut.',
  ),
  RoomSession(
    roomName: 'Coworking-01',
    category: 'Coworking',
    activity: 'Sesi kerja bersama penyusunan dokumentasi proyek Flutter',
    time: '08.00 - 11.00',
    status: 'Berlangsung',
    description:
        'Area coworking digunakan untuk mengerjakan dokumentasi proyek secara bersama-sama sambil melakukan pengecekan hasil implementasi aplikasi.',
  ),
  RoomSession(
    roomName: 'Coworking-01',
    category: 'Coworking',
    activity: 'Persiapan demo aplikasi untuk penilaian modul',
    time: '11.30 - 13.00',
    status: 'Akan Datang',
    description:
        'Mahasiswa menyiapkan demonstrasi aplikasi dan memastikan setiap fungsi utama dapat dijalankan sesuai kebutuhan tugas.',
  ),
  RoomSession(
    roomName: 'Coworking-01',
    category: 'Coworking',
    activity: 'Penyusunan laporan akhir dan bukti pengujian responsif',
    time: '13.00 - 15.00',
    status: 'Tersedia',
    description:
        'Tempat digunakan untuk menyusun laporan akhir, mengumpulkan screenshot, serta memeriksa tampilan pada beberapa ukuran viewport.',
  ),
  RoomSession(
    roomName: 'Coworking-02',
    category: 'Coworking',
    activity: 'Review hasil presentasi kelompok',
    time: '15.30 - 16.30',
    status: 'Selesai',
    description:
        'Sesi digunakan untuk mengevaluasi presentasi yang telah selesai dan mencatat hal-hal yang perlu diperbaiki pada pertemuan berikutnya.',
  ),
];