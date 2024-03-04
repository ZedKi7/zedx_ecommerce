import 'package:flutter/material.dart';

class ZProductPriceText extends StatelessWidget {
  const ZProductPriceText({
    super.key,
    required this.price,
    this.lineThrough = false,
    this.currencySign = '\$',
    this.isLarge = false,
    this.maxLines = 1,
  });

  final String currencySign, price;
  final bool isLarge, lineThrough;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
