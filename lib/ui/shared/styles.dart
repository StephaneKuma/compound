import 'package:flutter/material.dart';

// Box Decorations

BoxDecoration kFieldDecortaion = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Colors.grey[200],
);

BoxDecoration kDisabledFieldDecortaion = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Colors.grey[100],
);

// Field Variables

const double kFieldHeight = 55;
const double kSmallFieldHeight = 40;
const double kInputFieldBottomMargin = 30;
const double kInputFieldSmallBottomMargin = 0;
const EdgeInsets kFieldPadding = EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets kLargeFieldPadding = EdgeInsets.symmetric(
  horizontal: 15,
  vertical: 15,
);

// Text Variables
const TextStyle kButtonTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
