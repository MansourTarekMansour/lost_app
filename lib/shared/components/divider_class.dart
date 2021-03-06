import 'package:flutter/material.dart';

class DividerClass extends StatelessWidget {

  final Color color;
  final double? thickness;

  const DividerClass({this.color = const Color.fromRGBO(42, 185, 237, 1), this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(color: color, thickness: thickness);
  }
}
