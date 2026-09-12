import 'package:flutter/material.dart';

class JobsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JobsAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.chevron_left, color: Colors.black87, size: 28),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
