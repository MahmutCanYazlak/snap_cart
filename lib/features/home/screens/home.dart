import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/config/extension/context_extension.dart';
import 'package:snap_cart/core/resources/data_state.dart';
import 'package:snap_cart/features/home/controller/product_controller.dart';
import 'package:snap_cart/features/home/repository/product_repository.dart';
import 'package:snap_cart/features/home/widgets/categories_widget.dart';
import 'package:snap_cart/features/home/widgets/product_grid.dart';
import '../../../config/items/app_colors.dart';
import '../../../config/utility/enum/image_constants.dart';
import '../../../config/widget/custom_text/custom_text.dart';
import '../../../core/models/getMethods/products/get_all_categories_model.dart';
import '../../../core/models/getMethods/products/get_alll_products.dart';

void main() => runApp(const Home());

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int selectedIndex = -1;
  int pageIndex = 0;
  Future<List<Product>> products = Future.value([]);
  Future<List<GetAllCategoriesModel>>? categoriesFuture;
  bool isFetch = false;

  @override
  void initState() {
    super.initState();
    categoriesFuture = fetchGetCategories(context, ref);
    products = fetchGetProducts(context, ref);
    isFetch = ref.read(productsByCategoryNotifierProvider).isFetching;
  }

  Future<List<GetAllCategoriesModel>> fetchGetCategories(
      BuildContext context, WidgetRef ref) async {
    final dataState =
        await ref.read(productControllerProvider).getAllCategories();
    if (dataState is DataSuccess) {
      return dataState.data ?? [];
    } else {
      return [];
    }
  }

  Future<List<Product>> fetchGetProducts(
      BuildContext context, WidgetRef ref) async {
    final dataState =
        await ref.read(productControllerProvider).getAllProducts();
    if (dataState is DataSuccess) {
      return dataState.data ?? []; // Başarılıysa ürünleri döndür
    } else {
      return []; // Başarısızsa boş liste döndür
    }
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
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
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
                      height: context.height * 0.001,
                    ),
                    CategoriesWidget(
                      categoriesFuture: categoriesFuture,
                    ),
                    SizedBox(
                      height: context.height * 0.006,
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
                        ],
                      ),
                    ),
                    ProductGrid(
                      products: ref
                              .watch(productsByCategoryNotifierProvider)
                              .isFetching
                          ? ref
                              .watch(productsByCategoryNotifierProvider)
                              .getProducts
                          : products,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
