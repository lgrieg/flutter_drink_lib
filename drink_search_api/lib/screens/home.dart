import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../api/api.dart';
import '../tools/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<String> _searchString = ["margarita"];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            title: const Text("Search drinks by name"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                ),
                StatefulTextButton(searchHistory: _searchString),
                Container(
                  height: 40,
                ),
                FutureBuilder(
                  future: Api().getCocktail(_searchString.last),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final cocktails = snapshot.data!;
                    return CarouselSlider.builder(
                      itemCount: cocktails.length,
                      itemBuilder: (context, index, movieIndex) {
                        final cocktail = cocktails[index];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Stack(
                            children: [
                              Image.network(cocktail.imageUrl),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () => context.goNamed(
                                    'details',
                                    pathParameters: {'id': cocktail.id},
                                  ),
                                  child:
                                      Text('learn more about ${cocktail.name}'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        aspectRatio: 1.25,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
      valueListenable: inputTextNotifier,
    );
  }
}
