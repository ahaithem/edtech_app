import 'package:flutter/material.dart';
import '../constns/color_text_size.dart';

class CarouselExample extends StatefulWidget {
  final Function(String) onCategorySelected; // Callback for category selection

  const CarouselExample({super.key, required this.onCategorySelected});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  final List<String> items = [
    '#ALL',
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

  String selectedCategory = '#ALL'; // Track the selected category

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 50),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final category = items[index];
            final isSelected = category == selectedCategory;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                  });
                  widget.onCategorySelected(category); // Notify parent widget
                },
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: isSelected ? warning_color : secondary_color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.clip,
                      softWrap: false,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
