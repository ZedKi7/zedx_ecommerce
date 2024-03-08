import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_with_verified_icon.dart';

class ZBrandCard extends StatelessWidget {
  const ZBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: ZRoundedContainer(
        padding: const EdgeInsets.all(ZSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// Icon
            Flexible(
              child: ZCircularImage(
                image: ZImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? ZColors.white : ZColors.black,
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwItems / 2),

            /// Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ZBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                  Text('256 products', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
