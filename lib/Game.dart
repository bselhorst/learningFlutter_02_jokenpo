import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var _imageApp = AssetImage("images/padrao.png");
  var _message = "Choose one option";

  void _selectedOption(String selected) {
    var options = ["rock", "paper", "scissors"];
    var number = Random().nextInt(3);
    var selectedApp = options[number];
    var result = "";
    var image;

    switch (selectedApp) {
      case "rock":
        image = AssetImage("images/pedra.png");
        break;
      case "paper":
        image = AssetImage("images/papel.png");
        break;
      case "scissors":
        image = AssetImage("images/tesoura.png");
        break;
    }

    //Validação
    if (selectedApp == selected) {
      result = "Draw";
    }
    if ((selectedApp == "paper" && selected == "scissors") ||
        (selectedApp == "rock" && selected == "paper") ||
        (selectedApp == "scissors" && selected == "rock")) {
      result = "You won!";
    }
    if ((selectedApp == "paper" && selected == "rock") ||
        (selectedApp == "rock" && selected == "scissors") ||
        (selectedApp == "scissors" && selected == "paper")) {
      result = "You lose!";
    }
    setState(() {
      _message = result;
      this._imageApp = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: _imageApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _selectedOption("rock"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _selectedOption("paper"),
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _selectedOption("scissors"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
