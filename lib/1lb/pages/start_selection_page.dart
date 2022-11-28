import 'package:flutter/material.dart';
import 'package:mdi1lb/1lb/pages/replacement_page.dart';
import 'encryption_page.dart';

class StartSelectionPage extends StatelessWidget {
  const StartSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mdi 1-3'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              startButton('1lb', context, (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EncryptionPage(title: 'Методы перестановки',)),
                );
              },),
              startButton('2lb', context, (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReplacementPage(title: 'Методы замены',)),
                );
              },)
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
              return AlertDialog(
                //title: Text('Методы и средства защиты информации'),
                content: const Text('Методы и средства защиты информации'
                    '\nВыполнил: Сироткин Егор ПО(б)-91'),
                actions: <Widget>[
                  MaterialButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },);
          },
          child: const Icon(Icons.info),
        ),
    );
  }


  @override
  Widget startButton(String text, BuildContext context, VoidCallback onPressed){
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.lightBlue,
          child: MaterialButton(
            onPressed: onPressed,
            color: Colors.lightBlue,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

}

