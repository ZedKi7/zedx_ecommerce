import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/texts/brand_title_with_verified_icon.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/product_controller.dart';
import '../../../models/product_model.dart';

class ZProductMetaData extends StatelessWidget {
  const ZProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final productController = ProductController.instance;
    final salePercentage = productController.calculateSalePrecentage(product.price, product.salePrice);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            ZRoundedContainer(
              radius: ZSizes.sm,
              backgroundColor: ZColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: ZSizes.sm, vertical: ZSizes.xs),
              child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: ZColors.black)),
            ),
            const SizedBox(width: ZSizes.spaceBtwItems),

            /// Price
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text('\$${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(width: ZSizes.spaceBtwItems),
            ZProductPriceText(price: productController.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(width: ZSizes.spaceBtwItems / 1.5),

        /// Title
        ZProductTitleText(title: product.title),
        const SizedBox(width: ZSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ZProductTitleText(title: 'Status'),
            const SizedBox(width: ZSizes.spaceBtwItems / 1.5),
            Text(productController.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: ZSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            ZCircularImage(
              image: product.brand?.image ?? '',
              width: 32,
              height: 32,
              overlayColor: dark ? ZColors.white : ZColors.black,
            ),
            ZBrandTitleWithVerifiedIcon(title: product.brand?.name ?? '', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
