import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logic/caesar_logic.dart';
import '../logic/encryp_gamel.dart';
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

  String _textForEncryption = '';

  @override
  void initState(){
    super.initState();

    _textEditingController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _textForEncryption = _textEditingController.text;
    });
  }

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
              const SizedBox(
                height: 10,
              ),
              //MaterialButton(onPressed: (){encode();}),
              Expanded(
                  child: Center(
                    child: SelectableText(
                      _textEditingController.text,
                      style: const TextStyle(fontSize: 23.0),
                    ),
                  ),
              ),
              TextFormField(
                controller: _textEditingController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(28),
                ],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Текст для шифрования до 28 символов',
                  suffixIcon: IconButton(
                      onPressed: (){
                       // encode;
                        _textEditingController.clear();
                      },
                      icon: const Icon(Icons.clear),
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


  @override
  Widget encryptionBottons(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _textEditingController.text =
                            encodeKey(_textEditingController.text, [3,1,2,4], [1,3,7,6,5,4,2]);
                      });
                    },
                    color: Colors.lightBlue,
                    child: const Text(
                      'Зашифровать перестановкой',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Container(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _textEditingController.text =
                            deEncodeKey(_textEditingController.text, [3,1,2,4], [1,3,7,6,5,4,2]);
                      });
                    },
                    color: Colors.lightBlue,
                    child: const Text(
                      'Расшифровать',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _textEditingController.text =
                            caesar(_textEditingController.text);
                      });
                    },
                    color: Colors.lightBlue,
                    child: const Text(
                      'Алгоритм Цезаря',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 76,
                ),
                Container(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _textEditingController.text =
                        deCaesar(_textEditingController.text);
                      });
                    },
                    color: Colors.lightBlue,
                    child: const Text(
                      'Расшифровать ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _textEditingController.text =
                            gListToString(gamel(_textEditingController.text, [1,3,2,6,7,5,4]));
                      });
                    },
                    color: Colors.lightBlue,
                    child: const Text(
                      'Перестановка по \nГамильтоновым путям',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 41,
                ),
                Container(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _textEditingController.text =
                            deGamel(_textEditingController.text, [1,3,2,6,7,5,4]);
                      });
                    },
                    color: Colors.lightBlue,
                    child: const Text(
                      'Расшифровать ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }


}