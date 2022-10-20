
import 'package:flutter/material.dart';

class TextForEncryptionField extends StatefulWidget {
  const TextForEncryptionField({super.key, required this.title});

  final String title;

  @override
  _TextForEncryptionFieldState createState() => _TextForEncryptionFieldState();
}

class _TextForEncryptionFieldState extends State<TextForEncryptionField> {
  late final TextEditingController _textEditingController =
  TextEditingController();

  final List ideas = [
    "Пить воду в течение дня",
    "Делать разминку каждый день",
    "Есть сладкое только в первой половине дня"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Новая идея',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ideas.add(_textEditingController.text);
                    _textEditingController.clear();
                    setState(
                            () {}); // для обновления ui, так как ideas меняется. Также можно использовать ValueNotifier + ValueListenableBuilder
                  },
                  child: const Text('Добавить идею'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                ),
                for (var i in ideas) // так же можно использовать List.generate или ListView.builder
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Text("$i"),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
