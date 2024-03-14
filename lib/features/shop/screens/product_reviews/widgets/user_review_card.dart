import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/products/ratings/rating_bar_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(ZImages.userProfileImage1)),
                const SizedBox(width: ZSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Iconsax.more)),
            const SizedBox(height: ZSizes.spaceBtwItems),

            /// Review
            Row(
              children: [
                const ZRatingBarIndicator(rating: 4),
                const SizedBox(width: ZSizes.spaceBtwItems),
                Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: ZSizes.spaceBtwItems),
            const ReadMoreText(
              'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly, Great job!',
              trimLines: 1,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Show more',
              trimExpandedText: ' Show less',
              moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ZColors.primary),
              lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ZColors.primary),
            ),
            const SizedBox(height: ZSizes.spaceBtwItems),

            /// Company Review
            ZRoundedContainer(
              backgroundColor: dark ? ZColors.darkerGrey : ZColors.grey,
              child: Padding(
                padding: const EdgeInsets.all(ZSizes.md),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Z's Store", style: Theme.of(context).textTheme.titleMedium),
                        Text('02 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: ZSizes.spaceBtwItems),
                    const ReadMoreText(
                      'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly, Great job!',
                      trimLines: 1,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Show more',
                      trimExpandedText: ' Show less',
                      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ZColors.primary),
                      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ZColors.primary),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),
          ],
        )
      ],
    );
  }
}
