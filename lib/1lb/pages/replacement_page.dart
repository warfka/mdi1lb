import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logic/caesar_logic.dart';
import '../logic/encryp_gamel.dart';
import '../logic/encryption_logic.dart';

class ReplacementPage extends StatefulWidget {
  const ReplacementPage({super.key, required this.title});

  final String title;

  @override
  State<ReplacementPage> createState() => _ReplacementPageState();
}

class _ReplacementPageState extends State<ReplacementPage> {

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Шифрование Виженера',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
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
                        'Шифрование Бофорта',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
          ],
        )
    );
  }


}