
import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  final Function(String) onChange;

  const FilterBar({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    final categories = ["All", "Beauty", "Fragrances", "Groceries"];

    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, i) {
          return GestureDetector(
            onTap: () => onChange(categories[i]),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade100,
              ),
              child: Center(
                child: Text(categories[i]),
              ),
            ),
          );
        },
      ),
    );
  }
}
