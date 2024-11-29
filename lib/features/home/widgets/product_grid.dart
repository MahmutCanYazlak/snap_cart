import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/config/extension/context_extension.dart';
import 'package:snap_cart/config/routes/app_route_name.dart';
import '../../../config/items/app_colors.dart';
import '../../../core/models/getMethods/products/get_alll_products.dart';

class ProductGrid extends ConsumerWidget {
  final Future<List<Product>>? products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Product>>(
      future: products,
      initialData: const [], // Gerekirse burada başlangıç verisi de verebilirsiniz
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Bir hata oluştu: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("Hiç ürün yok."));
        } else {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Sütun sayısı
              childAspectRatio: .7, // Oran
              crossAxisSpacing: 10, // Yatay boşluk
              mainAxisSpacing: 10, // Dikey boşluk
            ),
            padding: EdgeInsetsDirectional.only(
                top: 0, bottom: context.height * 0.085),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index]; // Ürünü alın
              return InkWell(
                onTap: () {
                  // Ürün detay sayfasına git
                  Navigator.pushNamed(
                    context,
                    RouteNames.productDetail,
                    arguments: product,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Hero(
                        tag: product.id,
                        child: CachedNetworkImage(
                          width: context.width * 0.5,
                          height: context.height * 0.18,
                          imageUrl: product.thumbnail,
                          placeholder: (context, url) => Padding(
                            padding: context.paddingAllHigh,
                            child: const CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: context.paddingHorizontalLow,
                        child: Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        product.brand,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.grayColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        " ${product.price.toString()} \$",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
