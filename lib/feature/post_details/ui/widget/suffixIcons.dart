import 'package:flutter/material.dart';

class SuffixIcon extends StatelessWidget {
  const SuffixIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end, // icons at the end of the input
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.gif_box_outlined),
        Icon(Icons.file_open_outlined)
      ],
    );
  }
}