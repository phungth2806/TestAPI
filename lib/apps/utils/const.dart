import 'package:flutter/material.dart';

double getWidth(context) => MediaQuery.sizeOf(context).width;
double getHeight(context) => MediaQuery.sizeOf(context).height;

double paddingCustom(context) => getWidth(context) * 0.06;
