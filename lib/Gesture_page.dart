import 'package:flutter/material.dart';

class MyGesture extends StatelessWidget {
  MyGesture({@required this.text, @required this.ontap});
  final String text;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        color: Color(0xFFEB1555),
        //   margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 65.0,
      ),
    );
  }
}
