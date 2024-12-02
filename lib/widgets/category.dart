import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';

class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  final List<String> items = [
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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0), // Spacing between items
              child: UncontainedLayoutCard(
                label: items[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: secondary_color,
          borderRadius:
              BorderRadius.circular(20), // Rounded corners for better UI
        ),
        child: Text(
          label,
          style: textStyle,
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
      ),
    );
  }
}
