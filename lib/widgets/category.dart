import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';

class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  List<String> items = [
    '#CSS',
    '#UX',
    '#Flutter',
    '#Dart',
    '#Android',
    '#IOS',
    '#Web',
    '#HTML',
    '#Java',
    '#Python',
    '#C++',
    '#C',
    '#Kotlin',
    '#JavaScript',
    '#Cyber Security',
    '#Machine Learning',
    '#AI',
    '#React JS',
    '#Node JS',
    '#Angular JS',
    '#Vue JS',
    '#React Native',
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 50),
        child: CarouselView(
          itemExtent: 150,
          shrinkExtent: 100,
          children: items.map((String item) {
            return UncontainedLayoutCard(
                index: items.indexOf(item), label: item);
          }).toList(),
        ),
      ),
    );
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.index,
    required this.label,
  });

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: secondary_color,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
      ),
    );
  }
}
