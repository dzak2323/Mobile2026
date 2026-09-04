import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
void main() => runApp(const MyApp());


final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/', // Rute utama (Beranda)
      builder: (BuildContext context, GoRouterState state) {
        return const HalamanUtama(); // <-- Pasti akan garis merah, biarkan saja!
      },
    ),
    GoRoute(
      path: '/detail', // Rute halaman kedua
      builder: (BuildContext context, GoRouterState state) {
        return const HalamanDetail(); // <-- Ini juga akan garis merah, wajar!
      },
    ),
  ],
);
// ==========================================
// CLASS 1: MyApp
// ==========================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Portofolio Dzaki';

    return MaterialApp.router(
      routerConfig: _router, // <-- Aplikasi sekarang membaca peta rute di atas
      title: appTitle,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      // PERHATIKAN: Properti "home: Scaffold(...)" dihapus sepenuhnya dari sini!
    );
  }
} // <-- MyApp BARU DITUTUP DI SINI!


// ==========================================
// CLASS 2: HalamanUtama (Beranda)
// ==========================================
class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 26, 55),
      appBar: AppBar(
        title: const Text('Beranda Portofolio'),
        backgroundColor: const Color.fromARGB(255, 12, 40, 85),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Profil Section (Foto & Teks Bersebelahan)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ImageSection(
                    image: 'images/Foto_saya.jpg',
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleSection(
                          name: 'Muhammad Dzaki RifaI',
                          NIM: '2409106056',
                          location: 'Kelas B24, Informatika, Universitas Mulawarman',
                        ),
                        const TextSection(
                          description:
'''Perkenalkan saya Muhammad Dzaki RifaI, seorang mahasiswa di Kelas B24, Program Studi Informatika, Universitas Mulawarman.
Saat ini saya diminta membuat prototype aplikasi Flutter dengan tema "website pribadi" yah fungsinya porto lah ya.
Buat ini sambil baca Documentation + minta bantuan gemini terjemahkan karena bahasa dari documentation nya teknis banget.
Okey sekian dari saya terimakasih.''',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40), // Jarak pemisah
              
              // 2. Tombol Navigasi ke Halaman Detail
              Center(
                child: ElevatedButton.icon(
                  // FUNGSI INI YANG MEMBUKA HALAMAN BARU:
                  onPressed: () => context.push('/detail'), 
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Lihat Detail Proyek Saya'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// CLASS 3: HalamanDetail (Halaman Proyek)
// ==========================================
class HalamanDetail extends StatelessWidget {
  const HalamanDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 26, 55),
      appBar: AppBar(
        title: const Text('Detail & Proyek'),
        backgroundColor: const Color.fromARGB(255, 12, 40, 85),
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pengalaman & Proyek',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            
            // Daftar Proyek
            const Text(
              '• SI-Desa: Sistem Informasi Administrasi Desa Makmur Jaya (Project Manager).\n\n'
              '• Triditia Trade: Platform Katalog Web dan Manajemen Dokumentasi.\n\n'
              '• Jo-E Craft: E-Commerce Catalog Website.\n\n'
              '• Pengembangan Website Profil Pribadi menggunakan Flutter Web.',
              style: TextStyle(fontSize: 18, height: 1.5, color: Colors.white),
            ),
            const SizedBox(height: 40),
            
            // Tombol Kembali
            ElevatedButton.icon(
              // FUNGSI INI YANG MENUTUP HALAMAN (KEMBALI KE BERANDA):
              onPressed: () => context.pop(), 
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali ke Beranda'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// CLASS 2: TitleSection
// ==========================================
class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.NIM,
  });

  final String name;
  final String location;
  final String NIM;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(NIM, style: TextStyle(color: Colors.grey[500])),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          // Icon(Icons.star, color: Colors.red[500]),
          // const Text('41'),
        ],
      ),
    );
  }
}

// class ButtonSection extends StatelessWidget {
//   const ButtonSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Color color = Theme.of(context).primaryColor;
//     return SizedBox(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
//           ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE'),
//           ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
//         ],
//       ),
//     );
//   }

// }

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true, textAlign: TextAlign.left),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0, top: 20.0),
      child: CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage(image),
      ), // Memaksa gambar mengisi penuh area tanpa merubah proporsi aslinya
    );
  }
}

