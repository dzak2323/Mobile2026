import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// ==========================================
// CLASS 1: MyApp
// ==========================================
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // <-- Jangan ada kurung kurawal tutup } di baris ini!

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      home: Scaffold( // <-- Buka Scaffold
        backgroundColor: const Color.fromARGB(255, 7, 26, 55),

        // appBar: AppBar(title: const Text(appTitle)),
        body: const SingleChildScrollView( // <-- Buka SingleChildScrollView  
          child: Column( // <-- Buka Column
            children: [

              ImageSection(
                image: 'images/Foto_saya.jpg',
              ),

              // Memanggil class TitleSection
              TitleSection(
                name: 'Muhammad Dzaki RifaI',
                NIM: '2409106056',
                location: 'Kelas B24, Informatika, Universitas Mulawarman',
              ),
              // ButtonSection(),
              TextSection(
                description:
'''
Perkenalkan saya Muhammad Dzaki RifaI, seorang mahasiswa di Kelas B24, Program Studi Informatika, Universitas Mulawarman
saat ini saya diminta membuat prototype aplikasi Flutter dengan tema "website pribadi" yah fungsinya porto lah ya
buat ini sambil baca Documentation + minta bantuan gemini terjemahkan karena bahasa dari documentation nya teknis banget
okey sekian dari saya terimakasih''',)
            ],
          ), // <-- Tutup Column
        ), // <-- Tutup SingleChildScrollView
      ), // <-- Tutup Scaffold (Tadi ini yang hilang!)
    ); // <-- Tutup MaterialApp
  }
} // <-- MyApp BARU DITUTUP DI SINI!

// ==========================================
// CLASS 2: TitleSection 
// ==========================================
class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location, required this.NIM});

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
                  child: Text(name,style: const TextStyle(fontWeight: FontWeight.bold),
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
      child: Text(description, softWrap: true, textAlign: TextAlign.left,),
      
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
    return Image.asset(
      image,
      width: 200, // Lebar gambar
      height: 200, // Tinggi gambar
      fit: BoxFit.cover, // Memaksa gambar mengisi penuh area tanpa merubah proporsi aslinya
    );
  }
}
