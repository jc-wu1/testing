import 'package:flutter/material.dart';

class WidgetSpacer extends StatelessWidget {
  final double? _height;
  final double? _width;

  WidgetSpacer({double? height, double width = 0})
      : _height = height,
        _width = width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
    );
  }
}
