import 'package:flutter/material.dart';
class  RoundedIcon extends StatelessWidget {
RoundedIcon({@required this.icon,@required this.onPressed});
final Function onPressed;
final IconData icon;
@override
Widget build(BuildContext context) {
  return RawMaterialButton(
    onPressed: onPressed,
    child: Icon(icon),
    fillColor: Color(0xFF4CF5E),
    elevation: 0.0,
    shape: CircleBorder(),
    constraints: BoxConstraints.tightFor(
      width: 56.0,
      height: 56.0,
    ),

  );
}
}