import 'package:flutter/material.dart';

const double kMinRadius = 32.0;
const double kMaxRadius = 128.0;
const opacityCurve = Interval(0.0, 0.60, curve: Curves.fastOutSlowIn);

RectTween createRectTween(Rect? begin, Rect? end) {
  return MaterialRectCenterArcTween(begin: begin, end: end);
}
