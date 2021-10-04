import 'package:flutter/material.dart';

const Widget kHorizontalSpaceTiny = SizedBox(width: 5.0);
const Widget kHorizontalSpaceSmall = SizedBox(width: 10.0);
const Widget kHorizontalSpaceMedium = SizedBox(width: 25.0);

const Widget kVerticalSpaceTiny = SizedBox(height: 5.0);
const Widget kVerticalSpaceSmall = SizedBox(height: 10.0);
const Widget kVerticalSpaceMedium = SizedBox(height: 25.0);
const Widget kVerticalSpaceLarge = SizedBox(height: 50.0);
const Widget kVerticalSpaceMassive = SizedBox(height: 120.0);

Widget kSpacedDivider = Column(
  children: const <Widget>[
    kVerticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    kVerticalSpaceMedium,
  ],
);

Widget kVerticalSpace(double height) => SizedBox(height: height);

double kScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double kScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double ksSreenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (kScreenHeight(context) - offsetBy) / dividedBy;

double kScreenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (kScreenWidth(context) - offsetBy) / dividedBy;

double kHalfScreenWidth(BuildContext context) =>
    kScreenWidthFraction(context, dividedBy: 2);

double kThirdScreenWidth(BuildContext context) =>
    kScreenWidthFraction(context, dividedBy: 3);
