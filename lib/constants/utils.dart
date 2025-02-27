import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

class Utils {
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
}