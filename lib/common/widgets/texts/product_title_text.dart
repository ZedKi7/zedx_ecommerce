import 'package:flutter/material.dart';

class ZProductTitleText extends StatelessWidget {
  const ZProductTitleText({
    super.key,
    this.maxLines = 2,
    required this.title,
    this.smallSize = false,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
