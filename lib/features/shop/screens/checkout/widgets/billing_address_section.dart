import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class ZBillingAddressSection extends StatelessWidget {
  const ZBillingAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ZSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Coding with Z', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: ZSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(height: ZSizes.spaceBtwItems),
            Text('+92-317-8059525', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ZSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(height: ZSizes.spaceBtwItems),
            Expanded(child: Text('South Liana, Maine 87695, USA', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        ),
      ],
    );
  }
}
