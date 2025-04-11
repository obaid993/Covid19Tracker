// ignore_for_file: unused_import, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:covid19tracker/Constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReusableColumn extends StatelessWidget {
  String title;
  double value;
  Color? color;
  ReusableColumn({
    required this.title,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            NumberFormat.compact().format(value),
            style: TextStyle(
              fontSize: sNumberSize,
              color: color,
            ),
          ),
        ),
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: nFontSize,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
