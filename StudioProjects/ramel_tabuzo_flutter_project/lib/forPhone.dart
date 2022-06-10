import 'package:flutter/material.dart';
import 'dart:math';

class Baraha extends StatefulWidget {

  final number;
  final letter;
  Baraha({this.number,this.letter});
  @override
  State<Baraha> createState() => _BarahaState();
}

class _BarahaState extends State<Baraha> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      width: 90.0,

      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/${widget.number}${widget.letter}.png')),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    );
  }
}

class PhoneScreen extends StatefulWidget {
  const PhoneScreen ({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {

  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'CDHS';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  }
  int randomNumber(int min, int max){
    int random = min + Random().nextInt(max - min);
    return random;
  }
  int count = 0;
  int score = 0;
  int value = 0;
  var cardletter = 'C';
  int card_1 = 0;
  var letter_1 = 'C';
  int card_2 = 0;
  var letter_2 = 'C';
  int card_3 = 0;
  var letter_3 = 'C';
  int card_4 = 0;
  var letter_4 = 'C';
  int card_5 = 0;
  var letter_5 = 'C';

  void restart(){
    score = 0;
    value = 0;
    cardletter = 'C';
    card_2 = 0;
    letter_2 = 'C';
    card_3 = 0;
    letter_3 = 'C';
    card_4 = 0;
    letter_4 = 'C';
    card_5 = 0;
    letter_5 = 'C';
  }
  void pasa(){
    card_5 = card_4;
    card_4 = card_3;
    card_3 = card_2;
    card_2 = card_1;
    card_2 = card_1;
    card_1 = value;
    value = 0;
    letter_5 = letter_4;
    letter_4 = letter_3;
    letter_3 = letter_2;
    letter_2 = letter_1;
    letter_1 = cardletter;
    cardletter = 'C';
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.pink[100],
          title: Text('You Win!!'),
          content: Text("Are You Sure Want To Proceed ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                setState(() {
                  pasa();
                });
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }
  showAlertGAmeover(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.redAccent,
          title: Text('Gameover!!'),
          content: Text("Do you want to play again?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                setState(() {
                  restart();
                });
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }
  void greatEqual(){
    if(value >= card_1){
      score++;
      Future.delayed(Duration(milliseconds: 800), () {
        showAlert(context);
      });
    }
    else{
      Future.delayed(Duration(milliseconds: 800), () {
        showAlertGAmeover(context);

      });
    }
  }
  void lower(){
    if(value < card_1){
      score++;
      Future.delayed(Duration(milliseconds: 800), () {
        showAlert(context);

      });
    }
    else{
      Future.delayed(Duration(milliseconds: 800), () {
        showAlertGAmeover(context);
      });
    }
  }
  void randomCard(){
    value = randomNumber(1, 13);
    cardletter = generateRandomString(1);
  }
  void firstOpenCard(){
    if(score == 0 && count == 0){
      card_1 = randomNumber(1, 13);
      letter_1 = generateRandomString(1);
    }
    if(score == 0 && count > 0){
      card_1 = card_1;
      letter_1 = letter_1;
    }
  }

  @override
  Widget build(BuildContext context) {
    firstOpenCard();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
        Colors.blue,
        Colors.greenAccent,
        ],
    )
      ),
      child: Column(
        children: [
          SizedBox(height: 100,),
          Container(
            height: 40,
            width: 130,
            child: Center(
              child: Text('Score: $score',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 3,)
            ),
          ),
          SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Baraha(
                number: card_2,
                letter: letter_2,
              ),
              Baraha(
                number: card_3,
                letter: letter_3,
              ),
              Baraha(
                number: card_4,
                letter: letter_4,
              ),
              Baraha(
                number: card_5,
                letter: letter_5,
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Baraha(
                number: card_1,
                letter: letter_1,
              ),
              SizedBox(width: 15.0,),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.purpleAccent,
                          ],
                          begin:  Alignment.bottomLeft,
                          end: Alignment.topRight,
                        )
                    ),
                    child: FlatButton(
                      onPressed: (){
                        setState((){
                          count++;
                          randomCard();
                          greatEqual();
                        });
                      },
                      child: Text('=<',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PlayMeGames-Demo',
                          color: Colors.white70,
                          letterSpacing: 2.0,
                        ),),),
                  ),

                  SizedBox(height: 15.0,),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.purpleAccent,
                          ],
                          begin:  Alignment.bottomLeft,
                          end: Alignment.topRight,
                        )
                    ),
                    child: FlatButton(
                      onPressed: (){
                        setState((){
                          count++;
                          randomCard();
                          lower();
                        });
                      },
                      child: Text('>',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          letterSpacing: 2.0,
                        ),),),
                  ),
                ],
              ),
              SizedBox(width: 20.0,),
              Baraha(
                number: value,
                letter: cardletter,
              ),
            ],
          )
        ],
      ),
    );
  }
}


