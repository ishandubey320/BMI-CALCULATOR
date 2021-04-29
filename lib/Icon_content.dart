import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReuseChildCard extends StatelessWidget {
  ReuseChildCard({@required this.human, @required this.label});
  final IconData human;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          human,
          size: 65,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: Klabel,
        )
      ],
    );
  }
}

class LowerIcons extends StatelessWidget {
  LowerIcons({@required this.myicon, @required this.onpress});
  final IconData myicon;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: IconButton(
        icon: FaIcon(myicon),
        splashColor: Color(0xFFEB1555),
        splashRadius: 30,
        highlightColor: Colors.transparent,
        color: Colors.white,
        iconSize: 35,
        onPressed: onpress,
      ),
    );
  }
}
