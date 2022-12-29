import 'package:flutter/material.dart';
import 'package:pedalim/component/main_header.dart';
import 'package:pedalim/controller/controllers.dart';
import 'package:pedalim/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:pedalim/view/home/components/popular_product/popular_product.dart';
import 'package:pedalim/view/home/components/popular_product/popular_product_loading.dart';
import 'package:pedalim/view/home/components/section_title_for_product.dart';
import 'package:get/get.dart';

import 'components/carousel_slider/carousel_loading.dart';
import 'components/popular_category/popular_category.dart';
import 'components/popular_category/popular_category_loading.dart';
import 'components/section_tittle_for_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
              children: [
                Obx(() {
                  if (homeController.bannerList.isNotEmpty) {
                    return CarouselSliderView(
                        bannerList: homeController.bannerList);
                  } else {
                    return const CarouselLoading();
                  }
                }),
                const SectionTitleForCategories(title: "Popüler Kategoriler"),
                Obx(() {
                  if (homeController.popularCategoryList.isNotEmpty) {
                    return PopularCategory(
                        categories: homeController.popularCategoryList);
                  } else {
                    return const PopularCategoryLoading();
                  }
                }),
                const SectionTitleForProduct(title: "En Çok Satanlar"),
                Obx(() {
                  if (homeController.popularProductList.isNotEmpty) {
                    return PopularProduct(
                        popularProducts: homeController.popularProductList);
                  } else {
                    return const PopularProductLoading();
                  }
                }),
              ],
            ),
          ))
        ],
    ));
  }
}
