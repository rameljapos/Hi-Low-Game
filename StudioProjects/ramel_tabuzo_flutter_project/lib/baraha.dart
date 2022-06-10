import 'package:flutter/material.dart';

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
      height: 120.0,
      width: 70.0,

      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/${widget.number}${widget.letter}.png')),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    );
  }
}

