import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: desktopshow(),
  ));
}

class desktopshow extends StatefulWidget {
  const desktopshow({Key? key}) : super(key: key);

  @override
  State< desktopshow> createState() => _desktopshowState();
}

class _desktopshowState extends State< desktopshow> {

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
  int cardValue = 0;
  var letter = 'C';

  int cValue1 = 0;
  var cLetter1 = "C";

  int cValue2 = 0;
  var cLetter2 = 'C';

  int cValue3 = 0;
  var cLetter3 = 'C';

  int cValue4 = 0;
  var cLetter4 = 'C';

  int cValue5 = 0;
  var cLetter5 = 'C';


  void transferValue(){
    cValue5 = cValue4;
    cValue4 = cValue3;
    cValue3 = cValue2;
    cValue2 = cValue1;
    cValue1 = cardValue;
    cardValue = 0;
  }
  void transferLetter(){
    cLetter5 = cLetter4;
    cLetter4 = cLetter3;
    cLetter3 = cLetter2;
    cLetter2 = cLetter1;
    cLetter1 = letter;
    letter = 'C';
  }



  void tryAgain(){
    cValue1 = randomNumber(1, 13);
    cLetter1 = generateRandomString(1);
    cValue2 = 0;
    cLetter2 ='C';

    cValue3 = 0;
    cLetter3 = 'C';

    cValue4 = 0;
    cLetter4 = 'C';

    cValue5 = 0;
    cLetter5 = 'C';
    cardValue = 0;
    letter = 'C';
    score = 0;
  }
  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('You Win!!'),
          content: Text("Are You Sure Want To Proceed ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                setState(() {
                  transferValue();
                  transferLetter();
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
          title: Text('Gameover!!'),
          content: Text("Do you want to play again?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                setState(() {
                  tryAgain();
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
    if(cardValue >= cValue1){
      Future.delayed(Duration(milliseconds: 500), () {
        showAlert(context);
        score++;
      });
    }
    else{
      Future.delayed(Duration(milliseconds: 500), () {
        showAlertGAmeover(context);
      });
    }
  }
  void lower(){
    if(cardValue < cValue1){
      Future.delayed(Duration(milliseconds: 500), () {
        showAlert(context);
        score++;
      });
    }
    else{
      Future.delayed(Duration(milliseconds: 500), () {
        showAlertGAmeover(context);
      });

    }
  }
  void opencard(){
    if(score == 0 && count == 0){
      cValue1 = randomNumber(1, 13);
      cLetter1 = generateRandomString(1);
    }
    if(score == 0 && count > 0) {
      cValue1 = cValue1;
      cLetter1 = cLetter1;
    }
  }
  @override
  Widget build(BuildContext context) {
    opencard();


    return Container(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.greenAccent])),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 0.0),
            child: Column(
              children: [
                SizedBox(height: 5.0,),
                Text(
                  'Score: $score',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50.0,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 250.0,
                        width: 180.0,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/$cValue2$cLetter2.png')),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      Container(
                        height: 250.0,
                        width: 180.0,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/$cValue3$cLetter3.png')),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      Container(
                        height: 250.0,
                        width: 180.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/$cValue4$cLetter4.png')),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      Container(
                        height: 250.0,
                        width: 180.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/$cValue5$cLetter5.png')),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ]
                ),
                SizedBox(height: 100.0,),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 250.0,
                        width: 180.0,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //fit: BoxFit.fill,
                              image: AssetImage('assets/$cValue1$cLetter1.png')),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      SizedBox(width: 30.0,),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: LinearGradient(
                                    colors: [Colors.blue, Colors.purpleAccent],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                              ),
                              child: FlatButton(
                                onPressed: (){
                                  setState((){
                                    count++;
                                    cardValue = randomNumber(1, 13);
                                    letter = generateRandomString(1);
                                    greatEqual();
                                  });
                                },
                                child: Text('=<',
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                  ),),),
                            ),
                              SizedBox(height: 50.0,),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                gradient: LinearGradient(
                                  colors: [Colors.blue, Colors.purpleAccent],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: FlatButton(
                                onPressed: (){
                                  setState((){
                                    count++;
                                    cardValue = randomNumber(1, 13);
                                    letter = generateRandomString(1);
                                    lower();
                                  });
                                },
                                child: Text('>',
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                  ),),),
                            ),
                          ]
                      ),
                      SizedBox(width: 30.0,),
                      Container(
                        height: 250.0,
                        width: 180.0,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //fit: BoxFit.fill,
                              image: AssetImage('assets/$cardValue$letter.png')),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),

                    ]),

                /*Center(
               child: Text(
                   'Win!!',
                 style: TextStyle(
                   fontSize: 25.0,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),*/


              ],
            ),
          ),
        ),
      ),
    );
  }
}

