class Donatur {
  String donaturName;
  String donaturLocation;
  String donaturNote;
  String donaturImageAsset;
  List<String> imageUrls;

  Donatur({
    required this.donaturName,
    required this.donaturLocation,
    required this.donaturNote,
    required this.donaturImageAsset,
    required this.imageUrls,
  });
}

var donaturList = [
  Donatur(
    donaturName: 'TB SSM',
    donaturLocation: 'depan SPBU Meteseh',
    donaturNote: 'mobil angkutnya datang ketika masih longgar, mengingat banyak material yang harus dibawa',
    donaturImageAsset: 'images/ssm.jpg',
    imageUrls: [
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-1.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-2.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-3.jpg',
    ],
  ),
  Donatur(
    donaturName: 'Edo',
    donaturLocation: 'Perum 369 view kav 18',
    donaturNote: 'tolong nanti masuk aja, pagar tidak saya kunci, kebetulan kami ada acara keluar',
    donaturImageAsset: 'images/edo-house.jpg',
    imageUrls: [
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-4.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-5.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-6.jpg',
    ],
  ),
  Donatur(
    donaturName: 'Budi',
    donaturLocation: 'Perum.KPA Regency kav.111',
    donaturNote: 'barang berupa tandon air 1000L',
    donaturImageAsset: 'images/budi-house.jpg',
    imageUrls: [
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-7.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-8.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-9.jpg',
    ],
  ),
  Donatur(
    donaturName: 'TK Rizqi Jaya',
    donaturLocation: 'Jl. Kelapa Kopyor 1',
    donaturNote: 'mobil-mobilan pake accu charger',
    donaturImageAsset: 'images/tk-rizki-jaya.jpg',
    imageUrls: [
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-10.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-11.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-12.jpg',
    ],
  ),
  Donatur(
    donaturName: 'Cahya',
    donaturLocation: 'fak.Peternakan Undip',
    donaturNote: 'tolong kalo bisa datangnya pagi dibawah jam 9',
    donaturImageAsset: 'images/cahyo-house.jpg',
    imageUrls: [
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-13.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-14.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-15.jpg',
    ],
  ),
  Donatur(
    donaturName: 'Toko Husein',
    donaturLocation: 'BKJ AN20',
    donaturNote: 'tersedia minuman aqua gelas 1 box untuk kru',
    donaturImageAsset: 'images/toko-husein.jpg',
    imageUrls: [
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-16.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-17.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-18.jpg',
    ],
  ),
  Donatur(
    donaturName: 'Agus Cio',
    donaturLocation: 'Bukit Teratai VIII Sendangmulyo',
    donaturNote: 'terimakasih untuk kru SSB yang telah membantu menyalurkan sampah bekas kami',
    donaturImageAsset: 'images/agus-house.jpg',
    imageUrls: [
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-19.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-20.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-2.jpg',
    ],
  ),
  Donatur(
    donaturName: 'Muhsinin',
    donaturLocation: 'Griya Borobudur Mulawarman',
    donaturNote: 'semoga berkah',
    donaturImageAsset: 'images/muhsinin-house.jpg',
    imageUrls: [
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-3.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-7.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-10.jpg',
    ],
  ),
  Donatur(
    donaturName: 'Puji Riyadi',
    donaturLocation: 'Dewi Sartika Timur',
    donaturNote: 'silakan diambil kapan saja, selalu standby di rumah',
    donaturImageAsset: 'images/puji-riyadi-house.jpg',
    imageUrls: [
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-6.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-9.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-13.jpg',
    ],
  ),
  Donatur(
    donaturName: 'Bengkel Tri Mutiara',
    donaturLocation: 'Meteseh',
    donaturNote: 'mohon nanti ketemu pak Amir, barang sudah disiapkan beliau',
    donaturImageAsset: 'images/bengkel-tri-mutiara.jpg',
    imageUrls: [
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-15.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-18.jpg',
      'https://dutamediadigital.sgp1.digitaloceanspaces.com/masjoel/dok-4.jpg',
    ],
  ),
];
