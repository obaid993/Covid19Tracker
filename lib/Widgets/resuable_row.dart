// ignore_for_file: unused_import, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:covid19tracker/Constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReusableRow extends StatelessWidget {
  String title;
  double value;
  Color? color;

  ReusableRow({
    required this.title,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            NumberFormat.compact().format(value),
            style: TextStyle(
              fontSize: sNumberSize,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
