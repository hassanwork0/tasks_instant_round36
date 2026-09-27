import 'package:flutter/material.dart';

class SearchProductsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onBack;
  final TextEditingController? controller;
  final ValueChanged<String> onSearch;
  final VoidCallback onClear;

  const SearchProductsAppBar({
    super.key,
    required this.onBack,
    required this.controller,
    required this.onSearch,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: BackButton(onPressed: onBack),
      title: TextField(
        controller: controller,
        autofocus: true,

        textInputAction: TextInputAction.search,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.black),
          border: InputBorder.none,
        ),
        onChanged: (query) {
          onSearch(query);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            onClear();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
