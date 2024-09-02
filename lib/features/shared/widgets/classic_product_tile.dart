import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_shop/core/extensions/string_extensions.dart';
import 'package:swift_shop/core/extensions/text_style_extensions.dart';
import 'package:swift_shop/features/products/domain/product_model.dart';

import '../../../core/res/styles/text.dart';
import '../../products/presentation/widgets/color_pallete_widget.dart';
import '../../products/presentation/widgets/favorite_icon.dart';

class ClassicProductTile extends StatelessWidget {
  const ClassicProductTile(this.product, {super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.push('/products/${product.id}'),
      child: Container(
        width: (context.width / 2) - 30,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 228,
                  width: (context.width / 2) - 30,
                  decoration: BoxDecoration(
                      color: const Color(0xfff0f0f0),
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(product.image),
                      )),
                ),
                Positioned(
                  right: 0,
                  child: FavouriteIcon(productId: product.id),
                ),
              ],
            ),
            const Gap(5),
            Padding(
              padding: const EdgeInsets.all(5).copyWith(top: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name.truncateWithEllipsis(15),
                    maxLines: 1,
                    style: TextStyles.headingMedium4.adaptiveColour(context),
                  ),
                  const Gap(2),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.paragraphSubTextRegular2.grey,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyles.paragraphSubTextRegular3.orange,
                      ),
                      const Gap(6),
                      Flexible(
                        child: ColourPalette(
                          colours: product.colours.take(3).toList(),
                          radius: 5,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
