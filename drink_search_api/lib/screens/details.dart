import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../api/api.dart';
import '../tools/search.dart';

class Detail extends StatefulWidget {
  final String? id;
  const Detail({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => DetailState();
}

class DetailState extends State<Detail> {
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
            title: const Text("How to cook your drink"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                ),
                Container(
                  height: 40,
                ),
                FutureBuilder(
                  future: Api().getInfo(widget.id ?? '11007'),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final cocktails = snapshot.data!;
                    final cocktail = cocktails[0];
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                              fit: FlexFit.tight,
                              child: Image.network(
                                cocktail.imageUrl,
                                alignment: Alignment.topCenter,
                                fit: BoxFit.cover,
                              )),
                          Container(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cocktail.name,
                                  style: TextStyle(color: Colors.black),
                                ),
                                Container(height: 20),
                                Text(
                                  cocktail.instruction,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 20,
                          ),
                        ],
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
