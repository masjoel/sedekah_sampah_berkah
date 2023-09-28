import 'package:flutter/material.dart';
import 'package:sedekah_sampah_berkah/detail_page.dart';
import 'package:sedekah_sampah_berkah/model/donatur.dart';

class ListDonatur extends StatefulWidget {
  const ListDonatur({super.key});

  @override
  State<ListDonatur> createState() => _ListDonaturState();
}

class _ListDonaturState extends State<ListDonatur> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sedekah Sampah Berkah'),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return const DonaturList();
        } else if (constraints.maxWidth <= 1200) {
          return const DonaturGrid(gridCount: 4);
        } else {
          return const DonaturGrid(gridCount: 6);
        }
      }),
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
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
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
}

class DonaturList extends StatelessWidget {
  const DonaturList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Donatur place = donaturList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailPage(place: place);
                },
              ),
            );
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(place.donaturImageAsset),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              place.donaturName,
                              style: const TextStyle(
                                  fontSize: 16, fontFamily: 'Jost'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              place.donaturLocation,
                              style: const TextStyle(
                                  fontSize: 14, fontFamily: 'Jost'),
                            )
                          ])),
                )
              ],
            ),
          ),
        );
      },
      itemCount: donaturList.length,
    );
  }
}

class DonaturGrid extends StatelessWidget {
  final int gridCount;

  const DonaturGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: donaturList.map((place) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(place: place);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      place.donaturImageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      place.donaturName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      place.donaturLocation,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
