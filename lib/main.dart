import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  Color colorForIndex(int index){
    List<Color> colors = [Colors.red, Colors.orange, Colors.yellow, Colors.greenAccent, Colors.green, Colors.blue, Colors.purple ];
    
    return colors [index-1];
  }


  List<Widget> soundElements() {
    List<Widget> listArray = [];

    for (var i = 1; i <= 7; i++) {
      listArray.add(
        Expanded(
          child: new FlatButton(
            onPressed: () {
              final player = AudioCache();
              player.play('note$i.wav');
            },
            color: colorForIndex(i),
            splashColor: Colors.transparent,
          ),
        ),
      );
    }

    return listArray;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'X', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24.0)),
                TextSpan(text: 'Y', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 24.0)),
                TextSpan(text: 'L', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 24.0)),
                TextSpan(text: 'O', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 24.0)),
                TextSpan(text: 'P', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 24.0)),
                TextSpan(text: 'H', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 24.0)),
                TextSpan(text: 'O', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 24.0)),
                TextSpan(text: 'N', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 24.0)),
                TextSpan(text: 'E', style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold, fontSize: 24.0)),
                TextSpan(text: ' App', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 24.0)),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: soundElements(),
          ),
        ),
      ),
    );
  }
}
