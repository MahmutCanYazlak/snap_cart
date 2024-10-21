import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/config/extension/context_extension.dart';
import 'package:snap_cart/features/home/widgets/product_grid.dart';
import '../../../config/items/app_colors.dart';
import '../../../config/utility/enum/image_constants.dart';
import '../../../config/widget/custom_text/custom_text.dart';
import '../../../core/models/getMethods/get_alll_products.dart';
import '../widgets/categories_item.dart';

void main() => runApp(const Home());

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int selectedIndex = -1;
  int pageIndex = 0;
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
  }

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstants.location.getPng,
            ),
            Text(
              " TR, Ankara ",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
            ),
            Image.asset(ImageConstants.down.getPng)
          ],
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
                  size: 20,
                  label: "Get you food",
                  weight: FontWeight.w500,
                  color: AppColors.grayColor),
              const CustomText(
                size: 35,
                label: "Delivered!",
                weight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              const CustomText(
                  size: 22,
                  label: "Categories",
                  weight: FontWeight.w500,
                  color: AppColors.blackColor),
              SizedBox(
                height: context.height * 0.02,
              ),
              Padding(
                padding: EdgeInsetsDirectional.zero,
                child: SizedBox(
                  height: context.height * 0.2,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CatagoriesItemWidget(
                        image: ImageConstants.pizza,
                        text: 'Pizza',
                        isSelected: selectedIndex == 0,
                        onTap: () {
                          setState(() {
                            if (selectedIndex == 0) {
                              selectedIndex = -1;
                            } else {
                              selectedIndex = 0;
                            }
                          });
                        },
                      ),
                      CatagoriesItemWidget(
                        image: ImageConstants.burger,
                        text: 'Burger',
                        isSelected: selectedIndex == 1,
                        onTap: () {
                          setState(() {
                            if (selectedIndex == 1) {
                              selectedIndex = -1;
                            } else {
                              selectedIndex = 1;
                            }
                          });
                        },
                      ),
                      CatagoriesItemWidget(
                        image: ImageConstants.popcorn,
                        text: 'Popcorn',
                        isSelected: selectedIndex == 2,
                        onTap: () {
                          setState(() {
                            if (selectedIndex == 2) {
                              selectedIndex = -1;
                            } else {
                              selectedIndex = 2;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: context.height * 0.01),
                child: const Row(
                  children: [
                    CustomText(
                        size: 22,
                        label: "Popular Now",
                        weight: FontWeight.w500,
                        color: AppColors.blackColor),
                    Spacer(),
                    CustomText(
                        size: 15,
                        label: "View All",
                        weight: FontWeight.w500,
                        color: AppColors.blackColor),
                  ],
                ),
              ),
              const ProductGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
