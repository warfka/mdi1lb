import 'package:flutter/material.dart';
import 'package:matrix2d/matrix2d.dart';

import '../logic/caesar_logic.dart';
import '../logic/encryption_logic.dart';

class EncryptionPage extends StatefulWidget {
  const EncryptionPage({super.key, required this.title});

  final String title;

  @override
  State<EncryptionPage> createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {

  late final TextEditingController _textEditingController =
  TextEditingController();

  String textForEncryption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              MaterialButton(onPressed: (){encode();}),
              Expanded(
                  child: Container(
                    child: Center(
                      child: SelectableText(textForEncryption),
                    ),
                  ),
              ),
              TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Текст для шифрования до 28 символов',
                  suffixIcon: IconButton(
                      onPressed: (){
                        encode;
                        _textEditingController.clear();
                      },
                      icon: Icon(Icons.clear),
                  ),
                ),
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              encryptionBottons(),
            ],
          ),
        ),
      ),
    );
  }
void encode(){
    String s ='1234567890';
    List l = s.split('');
    print(l);
    //return encodeKey('value', [3,1,2,4], [1,3,7,6,5,4,2]);
    List list = [[0, 1, 2, 3, 4, 5, 6, 7]];
    list = list.reshape(2,4);
    print(list);
  }

  @override
  Widget encryptionBottons(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {
                textForEncryption =
                    encodeKey('Cироткин Егор Александрович', [3,1,2,4], [1,3,7,6,5,4,2]);
                //print(textForEncryption); _textEditingController.text Cироткин Егор Александрович
              });
            },
            color: Colors.lightBlue,
            child: const Text(
              'Зашифровать перестановкой',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                textForEncryption =
                    caesar('Cироткин Егор Александрович');
                //print(textForEncryption); _textEditingController.text Cироткин Егор Александрович
              });
            },
            color: Colors.lightBlue,
            child: const Text(
              'Шифр Цезаря',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )
    );
  }
}