import 'package:material_ui/material_ui.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  final categories = ['All', 'Italian', 'Healthy', 'Quick & Easy', 'Desserts'];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final isSelected = i == selected;
          return GestureDetector(
            onTap: () => setState(() => selected = i),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? Colors.orange : const Color(0xFFF0EDEA),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                categories[i],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : const Color(0xFF3A3A3A),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}