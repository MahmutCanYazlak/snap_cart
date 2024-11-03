import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../config/items/app_colors.dart';

class ProductImageCarousel extends StatelessWidget {
  const ProductImageCarousel({
    super.key,
    required this.images,
    required this.selectedIndex,
    required this.onPageChanged,
    required this.pageController,
  });

  final List<String> images;
  final int selectedIndex;
  final ValueChanged<int> onPageChanged;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: selectedIndex,
      child: SizedBox(
        height: context.height * 0.35,
        child: PageView.builder(
          controller: pageController,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return InteractiveViewer(
              
              panEnabled: true,
              minScale: 0.1,
              maxScale: 3.0,
              child: CachedNetworkImage(
                imageUrl: images[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => Padding(
                  padding: context.paddingAllHigh,
                  child: const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            );
          },
          onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}
