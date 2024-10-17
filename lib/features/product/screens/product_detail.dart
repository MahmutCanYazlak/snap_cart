import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';
import 'package:snap_cart/core/models/getMethods/get_alll_products.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Yeni eklenen paket

import '../../../config/items/app_colors.dart';
import '../../../config/utility/enum/image_constants.dart';
import '../../../config/widget/button/custom_square_button.dart';
import '../../../config/widget/custom_text/custom_text.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedIndex = 0;
  final PageController _pageController =
      PageController(); // PageView için kontrolcü

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // AppBar'ın arka planını genişlet
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(ImageConstants.voice.getPng),
          )
        ],
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Image.asset(ImageConstants.options.getPng),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.height * 0.12,
                ),
                Hero(
                  tag: widget.product.id,
                  child: SizedBox(
                    height: context.height * 0.35,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.product.images.length,
                      itemBuilder: (context, index) {
                        return InteractiveViewer(
                          panEnabled: true,
                          minScale: 0.1,
                          maxScale: 3.0, // Yaklaştırma oranı
                          child: CachedNetworkImage(
                            imageUrl: widget.product.images[index],
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Padding(
                              padding: context.paddingAllHigh,
                              child: Padding(
                                padding: context.paddingAllHigh,
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.primary),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        );
                      },
                      onPageChanged: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: widget.product.images.length,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.darkGrayColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                CustomText(
                  textAlign: TextAlign.start,
                  size: 35,
                  label: widget.product.title,
                  weight: FontWeight.w600,
                ),
                SizedBox(
                  height: context.height * 0.005,
                ),
                Padding(
                  padding: context.paddingLeftLow,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        size: 20,
                        label: "${widget.product.price} \$",
                        weight: FontWeight.w500,
                      ),
                      const Spacer(),
                      CustomSquareButton(
                        widget: const CustomText(
                          label: "-",
                        ),
                        width: context.width * 0.08,
                        color: AppColors.whiteColor,
                      ),
                      Padding(
                        padding: context.paddingAllLow,
                        child: const CustomText(
                          label: "1",
                        ),
                      ),
                      CustomSquareButton(
                        widget: const CustomText(
                          label: "+",
                        ),
                        width: context.width * 0.08,
                        isSelected: true,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RecipeInfo(
                      imageConstants: ImageConstants.star.getPng,
                      label: "4.5",
                    ),
                    RecipeInfo(
                      imageConstants: ImageConstants.fire.getPng,
                      label: "350 kcal",
                    ),
                    RecipeInfo(
                      imageConstants: ImageConstants.timeCircle.getPng,
                      label: "30 min",
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                const CustomText(
                  size: 20,
                  label: "Details",
                  weight: FontWeight.w500,
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                CustomText(
                  label: widget.product.description,
                  weight: FontWeight.w400,
                  color: AppColors.darkGrayColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeInfo extends StatelessWidget {
  const RecipeInfo({
    super.key,
    required this.imageConstants,
    required this.label,
  });
  final String label;
  final String imageConstants;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageConstants,
        ),
        SizedBox(
          width: context.width * 0.02,
        ),
        CustomText(
          label: label,
          weight: FontWeight.w500,
          color: AppColors.darkGrayColor,
        ),
      ],
    );
  }
}
