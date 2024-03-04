import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum CardSide { front, back }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CardSide _cardSide = CardSide.front;

  void _toggleCardSide() {
    setState(() {
      _cardSide = _cardSide == CardSide.front ? CardSide.back : CardSide.front;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Student ID Card'),
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(
              onPressed: _toggleCardSide,
              icon: Icon(_cardSide == CardSide.front
                  ? Icons.flip_to_back
                  : Icons.flip_to_front),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                _cardSide == CardSide.front
                    ? _buildFrontSide()
                    : _buildBackSide(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFrontSide() {
    return Column(
      children: <Widget>[
        Container(
          width: 310,
          height: 245,
          color: Colors.blueGrey[900],
          padding:
              const EdgeInsets.only(top: 20, bottom: 0, left: 10, right: 10),
          child: const Row(
            children: [
              Image(
                image: AssetImage('./assets/img.jpg'),
                width: 240,
                height: 225,
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'CIIT/SP22-BSE-103/LHR',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildTextRow('STUDENT', fontSize: 35, fontWeight: FontWeight.bold),
        _buildTextRow('Software Engineering', fontSize: 12),
        _buildTextRow('Muhammad Nouman', fontSize: 15),
        const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 0),
          child: Image(
            image: AssetImage('./assets/logo.png'),
            width: 100,
            height: 100,
          ),
        ),
        _buildTextRow('CUI, Lahore Campus', fontSize: 12),
      ],
    );
  }

  Widget _buildBackSide() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blueGrey[900],
          padding: const EdgeInsets.all(17),
          width: 310,
          height: 245,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTextRow('Validity',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  Color: Colors.white),
              _buildTextRow('Feb 2022 - Feb 2026',
                  fontSize: 12, Color: Colors.white),
              _buildTextRow('Emergency',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  Color: Colors.white),
              _buildTextRow('042-111-001-007',
                  fontSize: 12, Color: Colors.white),
              _buildTextRow('www.cuilahore.edu.pk',
                  fontSize: 12, Color: Colors.white),
            ],
          ),
        ),
        Center(
          child: _buildTextRow(
              '\nThis card is\nnon transferable\n\nThis card is property of\nCOMSATS UNIVERSITY ISLAMABAD\nLahore, Campus\n\nIn case of loss report to\nCUI Lahore\nImmediately.\n\nDefence Road\nOff Raiwind Road,\nLahore',
              fontSize: 10,
              Color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildTextRow(String text,
      {double fontSize = 15, FontWeight? fontWeight, Color? Color}) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style:
            TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: Color),
      ),
    );
  }
}
