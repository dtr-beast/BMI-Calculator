import 'package:flutter/material.dart';

import 'constants.dart';

class CardChildIcon extends StatelessWidget {
  final String cardText;
  final IconData cardIcon;

  const CardChildIcon({Key key, this.cardText, this.cardIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
          color: Colors.white60,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: kTextStyle,
        ),
      ],
    );
  }
}

class FlexCard extends StatelessWidget {
  // Curly braces "{}" for named arguments
  FlexCard({this.colour = const Color(0xFF1D1E33), this.cardChild, this.onTap});

  final Color colour;
  final Widget cardChild;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
      onTap: this.onTap,
    );
  }
}
