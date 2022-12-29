import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedalim/component/main_header.dart';
import 'package:pedalim/controller/controllers.dart';
import 'package:pedalim/view/product/components/product_grid.dart';
import 'package:pedalim/view/product/components/product_loading_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
              child: Obx((){
                if(productController.isProductLoading.value){
                  return const ProductLoadingGrid();
                } else {
                  if(productController.productList.isNotEmpty){
                    return ProductGrid(products: productController.productList);
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/bulunamadi.png'),
                        const Text('Aradığınız bisikleti bulamadık.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    );
                  }
                }
              })
          )
        ],
      ),
    );
  }
}