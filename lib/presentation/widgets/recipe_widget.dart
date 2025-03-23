import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {
  final String? label;
  final String? imageUrl;

  const RecipeWidget({super.key, this.label, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label ?? "No data found"),
      leading: Image.network(
        imageUrl!,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset("");
        },
      ),
    );
  }
}
