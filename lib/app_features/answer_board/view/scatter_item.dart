import 'package:flutter/material.dart';
import 'package:word_cloud_poc/models/scatter_model.dart';

class ScatterItem extends StatelessWidget {
  ScatterItem(this.hashtag, this.index, {Key? key});

  final ScatterModel hashtag;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: hashtag.size.toDouble(),
          color: hashtag.color,
        );
    return RotatedBox(
      quarterTurns: hashtag.rorate ? 1 : 0,
      child: Text(
        hashtag.title,
        style: style,
      ),
    );
  }
}
