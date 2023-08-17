import 'package:flutter/material.dart';

class StackedWidgets extends StatelessWidget {
  final List<Widget> items;
  final TextDirection direction;
  final double size;
  final double xShift;

  const StackedWidgets({
    Key? key,
    required this.items,
    this.direction = TextDirection.ltr,
    this.size = 50,
    this.xShift = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems = items
        .asMap()
        .map((index, item) {
          final left = size - xShift;

          final value = Container(
            width: size,
            height: size,
            margin: EdgeInsets.only(left: left * index),
            child: item,
          );

          return MapEntry(index, value);
        })
        .values
        .toList();

    return Row(children: [
      Stack(
        children: direction == TextDirection.ltr
            ? allItems.reversed.toList()
            : allItems,
      ),
    ]);
  }
}

final List assetImages = [
  'assets/police.png',
  'assets/frsc.png',
  'assets/fireservice.png',
];

Widget buildAssetImage(String urlImage) {
  return ClipOval(
    child: Container(
      padding: const EdgeInsets.all(2),
      color: Colors.white,
      child: ClipOval(
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget buildNetworkImage(String urlImage) {
  return ClipOval(
    child: Container(
      padding: const EdgeInsets.all(2),
      color: Colors.white,
      child: ClipOval(
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
