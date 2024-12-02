import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/config/extension/context_extension.dart';
import 'package:snap_cart/core/models/getMethods/products/get_alll_products.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:snap_cart/core/models/order/cart_item_model.dart';
import '../../../config/items/app_colors.dart';
import '../../../config/utility/enum/image_constants.dart';
import '../../../config/widget/custom_text/custom_text.dart';
import '../../order/controller/order_controller.dart';
import '../widget/product_image_carousel.dart';
import '../widget/product_review.dart';
import '../widget/quantity_selector.dart';
import '../widget/recipen_info.dart';

class ProductDetail extends ConsumerStatefulWidget {
  const ProductDetail({super.key, required this.product});
  final Product product;

  @override
  ConsumerState<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  int selectedIndex = 0;
  double originalPrice = 0;
  int quantity = 0;
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  late final OrderController orderController;

  void calculateOriginalPrice() {
    originalPrice =
        widget.product.price / (1 - (widget.product.discountPercentage / 100));
    String formattedPrice = originalPrice.toStringAsFixed(2);
    originalPrice = double.parse(formattedPrice);
  }

  void scrollToReviews() {
    _scrollController.animateTo(
      context.height * 0.8,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    orderController = ref.read(orderControllerProvider);
    // Sepetteki ürünlerden, şu anki ürüne ait olanı bulup quantity değerini alıyoruz
    final orderItems = orderController.getCartItems();
    quantity = 0;
    for (var i = 0; i < orderItems.length; i++) {
      if (orderItems[i].product.id == widget.product.id) {
        quantity++;
      }
    }

    calculateOriginalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(ImageConstants.basket.getPng),
                color: AppColors.primary,
              ))
        ],
        centerTitle: true,
        leadingWidth: context.width * 0.15,
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
            controller: _scrollController, // ScrollController ekle
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.height * 0.12,
                ),
                ProductImageCarousel(
                  pageController: _pageController,
                  images: widget.product.images,
                  selectedIndex: widget.product.id,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
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
                  bottomPadding: context.height * 0.015,
                ),
                Padding(
                  padding: context.paddingLeftLow,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 0,
                            top: -23,
                            child: Transform.rotate(
                              angle: -0.1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(3),
                                child: CustomText(
                                  label: " $originalPrice \$ ",
                                  color: Colors.red,
                                  weight: FontWeight.bold,
                                  textDecoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(3),
                            child: CustomText(
                              size: context.width * 0.048,
                              label: " ${widget.product.price} \$  ",
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      QuantitySelector(
                        quantity: quantity,
                        onIncrease: () {
                          // Arttırma işlemi
                          setState(() {
                            quantity++;
                          });
                          orderController.addProductToCart(CartItemModel(
                              product: widget.product, quantity: quantity));
                        },
                        onDecrease: () {
                          // Azaltma işlemi
                          if (quantity > 0) {
                            setState(() {
                              quantity--;
                            });
                            orderController.removeProductFromCart(CartItemModel(
                                product: widget.product, quantity: quantity));
                          }
                        },
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
                      label: widget.product.rating.toString(),
                    ),
                    RecipeInfo(
                      imageConstants: ImageConstants.fire.getPng,
                      label: widget.product.stock.toString(),
                    ),
                    InkWell(
                      onTap: scrollToReviews,
                      child: RecipeInfo(
                        imageConstants: ImageConstants.timeCircle.getPng,
                        label: ("${widget.product.reviews.length} Reviews"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                CustomText(
                  size: 20,
                  label: "Details",
                  weight: FontWeight.w500,
                  bottomPadding: context.height * 0.01,
                ),
                CustomText(
                  textAlign: TextAlign.justify,
                  label: widget.product.description,
                  weight: FontWeight.w400,
                  color: AppColors.darkGrayColor,
                  bottomPadding: context.height * 0.02,
                ),
                CustomText(
                  size: 20,
                  label: "Return Policy",
                  weight: FontWeight.w500,
                  bottomPadding: context.height * 0.01,
                ),
                CustomText(
                  textAlign: TextAlign.justify,
                  label: widget.product.returnPolicy,
                  weight: FontWeight.w400,
                  color: AppColors.darkGrayColor,
                  bottomPadding: context.height * 0.02,
                ),
                const Divider(
                  color: AppColors.lightGrayColor,
                  thickness: 1,
                ),
                CustomText(
                  size: 20,
                  label: "Reviews",
                  weight: FontWeight.w500,
                  bottomPadding: context.height * 0.01,
                ),
                ProductReview(widget: widget),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
