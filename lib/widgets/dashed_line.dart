import 'package:flutter/material.dart';

class DLDashedLine extends StatelessWidget {
  final Axis axis;
  final Color color;
  final double lineWidth;
  final double lineHeight;
  final int count;

  const DLDashedLine(
      {Key key,
      this.axis = Axis.horizontal,
      this.color = Colors.red,
      this.lineWidth = 1,
      this.lineHeight = 1,
      this.count = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (_) {
        return SizedBox(
          width: lineWidth,
          height: lineHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        );
      }),
    );
  }
}
