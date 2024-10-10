import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../config/items/app_colors.dart';
import '../../../config/utility/enum/image_constants.dart';
import '../../../config/widget/button/custom_square_button.dart';
import '../../../config/widget/custom_text/custom_text.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedIndex = 0;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height * 0.12,
              ),
              const CustomText(
                size: 35,
                label: "Margherita Pizza",
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: context.height * 0.005,
              ),
              const CustomText(
                size: 20,
                label: "Rs. 1250",
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                children: [
                  Padding(
                    padding: context.paddingLeftLow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          label: "Size",
                          weight: FontWeight.w500,
                          color: AppColors.grayColor,
                        ),
                        CustomSquareButton(
                          widget: const CustomText(
                            label: "S",
                          ),
                          width: context.width * 0.08,
                          color: AppColors.primary,
                          isSelected: selectedIndex == 0,
                          onPressed: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                        ),
                        CustomSquareButton(
                          widget: const CustomText(
                            label: "M",
                          ),
                          width: context.width * 0.08,
                          color: AppColors.primary,
                          isSelected: selectedIndex == 1,
                          onPressed: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                        ),
                        CustomSquareButton(
                          widget: const CustomText(
                            label: "L",
                          ),
                          width: context.width * 0.08,
                          color: AppColors.primary,
                          isSelected: selectedIndex == 2,
                          onPressed: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                        ),
                        const CustomText(
                          label: "Quantity",
                          weight: FontWeight.w500,
                          color: AppColors.grayColor,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.05,
                  ),
                  Image.asset(
                    ImageConstants.pizzaLarge.getPng,
                    width: selectedIndex == 0
                        ? context.width * 0.5
                        : selectedIndex == 1
                            ? context.width * 0.55
                            : context.width * 0.60,
                  ),
                ],
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
              const CustomText(
                label:
                    "The cheese is melted and just about completely forms a liquid with the tomato sauce at the time of serving. The taste is of bread, cheese and a tomato sauce made with ripes tomatoes. The main ingredients for the Pizza are basil, mozzarella cheese and red tomatoes.",
                weight: FontWeight.w400,
                color: AppColors.darkGrayColor,
              ),
            ],
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
