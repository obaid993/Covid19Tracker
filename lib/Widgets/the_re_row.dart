// ignore_for_file: unused_import, must_be_immutable, use_key_in_widget_constructors

import 'package:covid19tracker/Constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'reusable_column.dart';

class ReRow extends StatelessWidget {
  String title;
  double value;

  ReRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          ReusableColumn(title: title, value: value)
        ],
      ),
    );
  }
}
