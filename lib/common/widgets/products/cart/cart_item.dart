import 'package:flutter/material.dart';

import '../../../../features/shop/models/cart_item_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class ZCartItem extends StatelessWidget {
  const ZCartItem({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        ZRoundedImage(
          imageUrl: cartItem.image ?? '',
          isNetworkImage: true,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(ZSizes.sm),
          backgroundColor: ZHelperFunctions.isDarkMode(context) ? ZColors.darkerGrey : ZColors.light,
        ),
        const SizedBox(width: ZSizes.spaceBtwItems),

        /// Title, Ptice, Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(child: ZProductTitleText(title: cartItem.title, maxLines: 1)),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map(
                        (entry) => TextSpan(
                          children: [
                            TextSpan(text: '${entry.key} ', style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(text: '${entry.value} ', style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
