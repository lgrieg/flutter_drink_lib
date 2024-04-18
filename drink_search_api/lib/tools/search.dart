import 'package:flutter/material.dart';

final inputTextNotifier = ValueNotifier(0);

class StatefulTextButton extends StatefulWidget {
  final List<String> searchHistory;
  const StatefulTextButton({super.key, required this.searchHistory});
  @override
  State<StatefulWidget> createState() => TextButtonState();
}

class TextButtonState extends State<StatefulTextButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      builder: (context, value, child) {
        return TextField(
          style: TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              labelText: 'Wanna find some?',
              prefixStyle: TextStyle(color: Colors.white),
              icon: Icon(Icons.search_sharp)),
          onChanged: (text) {
            setState(
              () {
                widget.searchHistory.last = text;
                inputTextNotifier.value++;
              },
            );
          },
        );
      },
      valueListenable: inputTextNotifier,
    );
  }
}
