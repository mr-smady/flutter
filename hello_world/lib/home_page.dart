import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_language_fonts/google_language_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.blueAccent[400],
            child: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: CachedNetworkImage(
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Center(
                child: Text(
                  'جميل',
                  style: ArabicFonts.balooBhaijaan(
                    fontSize: 100,
                  ),
                ),
              ),
              const Icon(Icons.directions_bike),
            ],
          ),
        ),
      );
}
