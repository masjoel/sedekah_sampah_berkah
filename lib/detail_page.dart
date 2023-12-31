import 'package:flutter/material.dart';
import 'package:sedekah_sampah_berkah/list_donatur.dart';
import 'package:sedekah_sampah_berkah/model/donatur.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Jost');

class DetailPage extends StatefulWidget {
  final Donatur place;
  const DetailPage({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 800) {
        return DetailWebPage(place: widget.place);
      } else {
        return DetailMobilePage(place: widget.place);
      }
    });
  }
}

class DetailWebPage extends StatefulWidget {
  final Donatur place;

  const DetailWebPage({super.key, required this.place});

  @override
  // ignore: library_private_types_in_public_api
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 64,
          ),
          child: Center(
            child: SizedBox(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Sedekah Sampah Berkah',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(widget.place.donaturImageAsset),
                            ),
                            const SizedBox(height: 16),
                            Scrollbar(
                              controller: _scrollController,
                              child: Container(
                                height: 150,
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ListView(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  children: widget.place.imageUrls.map((url) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(url),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  widget.place.donaturName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'Jost',
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    widget.place.donaturLocation,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'Jost',
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16.0),
                                  child: Text(
                                    'Pesan : ${widget.place.donaturNote}',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Jost',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'Teknis Operasional',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          switch (index) {
            case 0:
              // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeOut,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ListDonatur();
                    },
                  ),
                );
              }
            case 1:
              showModal(context);
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Column(
          children: [
            Text(
              'TEKNIS OPERASIONAL\n',
              style: TextStyle(
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Text(
              '1. Sampah dan barang bekas yg bernilai jual dikumpulkan dirumah masing-masing. \nJenis Barang/Sampah : Plastik botol, ember, gelas ; semua jenis kertas ; semua jenis logam (besi, tembaga, alumunium, seng dll) ; Perabot/perlengkapan rumah tangga ; Kayu balok, kaso dll ; Fiberglass, akrilik dll. \n2. Sampah yg sudah dikumpulkan diambil tiap pekan satu kali. \n3. Waktu pengambilan Hari AHAD jam : 08.00 s/d 12.00 \n4. Rute pengambilan sampah disesuaikan dengan jalur terdekat sampai paling jauh. Akan ada pemberitahuan menyusul 1 hari sebelum pengambilan/hubungi Relawan kami yg terdekat. \n5. Jumlah personel 1 pick up max.3 orang. \n\nNb: Maaf... untuk sedekah mebel dan pakaian pantas pakai sementara di stop dulu mengingat gudang SSB sedang direnovasi.\n\nGudang/Sekretariat Baru \nKomplek Perum BKJ \nJln. Bukit Palm Raya Blok  CA/8 \nMeteseh, Tembalang, Semarang. \nHp. 081325462389',
              style: TextStyle(fontFamily: 'Jost', fontSize: 14),
            ),
          ],
        ),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class DetailMobilePage extends StatelessWidget {
  final Donatur place;
  const DetailMobilePage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(place.donaturImageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                place.donaturName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Jost',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                place.donaturLocation,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Jost',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Pesan : ${place.donaturNote}',
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16.0, fontFamily: 'Jost'),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(url)),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
