import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class ZHomeCategories extends StatelessWidget {
  const ZHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return ZVerticalImageText(
            title: 'Shoes',
            image: ZImages.sportIcon,
            onTap: () {},
          );
        },
      ),
    );
  }
}
