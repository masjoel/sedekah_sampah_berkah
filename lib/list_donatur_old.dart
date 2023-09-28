import 'package:flutter/material.dart';
import 'package:sedekah_sampah_berkah/detail_page.dart';
import 'package:sedekah_sampah_berkah/model/donatur.dart';

class ListDonatur extends StatelessWidget {
  const ListDonatur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Sedekah Sampah Berkah'),
            // Text('Sedekah Sampah Berkah. Size: ${MediaQuery.of(context).size.width}'),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(place: place);
            }));
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
