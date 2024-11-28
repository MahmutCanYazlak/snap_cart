import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';
import 'package:snap_cart/features/home/widgets/categories_item.dart';

import '../../../core/models/getMethods/products/get_all_categories_model.dart';

class CategoriesWidget extends StatefulWidget {
  final Future<List<GetAllCategoriesModel>>? categoriesFuture;

  const CategoriesWidget({
    super.key,
    required this.categoriesFuture,
  });

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.zero,
      child: SizedBox(
        height: context.height * 0.18,
        child: FutureBuilder(
          future: widget.categoriesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Bir hata oluştu"),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text("Kategori yok."),
              );
            } else {
              final data = snapshot.data as List<GetAllCategoriesModel>;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return CatagoriesItemWidget(
                    text: data[index].name ?? "",
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        if (selectedIndex == index) {
                          selectedIndex = -1;
                        } else {
                          selectedIndex = index;
                        }
                      });
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
