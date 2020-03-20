import 'package:flutter/material.dart';

class DLStarRate extends StatefulWidget {
  final double score;
  final double maxScore;
  final int count;
  final double starSize;
  final Color selectedColor;
  final Color unselectedColor;
  final Widget selectedStar;
  final Widget unselectedStar;

  DLStarRate(
      {Key key,
      @required this.score,
      this.maxScore = 10,
      this.count = 5,
      this.starSize = 30,
      this.selectedColor = const Color(0xffff0000),
      this.unselectedColor = const Color(0xffbbbbbb),
      Widget selectedStar,
      Widget unselectedStar})
      : selectedStar = selectedStar ??
            Icon(Icons.star, color: selectedColor, size: starSize),
        unselectedStar = unselectedStar ??
            Icon(Icons.star_border, color: unselectedColor, size: starSize),
        super(key: key);

  @override
  _DLStarRateState createState() => _DLStarRateState();
}

class _DLStarRateState extends State<DLStarRate> {
  @override
  Widget build(BuildContext context) {
    var unselectedStar = widget.unselectedStar;
    var count = widget.count;

    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(count, (index) {
            return unselectedStar;
          }),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: _buildSelectedStars(),
        )
      ],
    );
  }

  List<Widget> _buildSelectedStars() {
    final starSize = widget.starSize;
    final score = widget.score;
    final maxScore = widget.maxScore;
    final count = widget.count;
    final selectedWidget = widget.selectedStar;
    final List<Widget> stars = [];

    final proStarScore = maxScore / count;
    final int fullStarCount = (score / proStarScore).floor();
    final leftWidth = ((score / proStarScore) - fullStarCount) * starSize;
    for (var i = 0; i < fullStarCount; i++) {
      stars.add(selectedWidget);
    }

    if (leftWidth > 0) {
      final partialStar = ClipRect(
        clipper: DLClipper(leftWidth),
        child: selectedWidget,
      );
      stars.add(partialStar);
    }

    return stars;
  }
}

class DLClipper extends CustomClipper<Rect> {
  final double width;

  DLClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(DLClipper oldClipper) {
    return oldClipper.width != width;
  }
}
