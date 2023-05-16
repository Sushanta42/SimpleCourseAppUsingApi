import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const ListTileWidget({
    required this.title,
    this.subtitle = "",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: subtitle.isEmpty ? const SizedBox() : Text(subtitle),
    );
  }
}
