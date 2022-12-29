import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pedalim/const.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controller/controllers.dart';
import '../../../../model/product.dart';

class PopularProductCard extends StatefulWidget {
  final Product product;
  const PopularProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<PopularProductCard> createState() => _PopularProductCardState();
}

class _PopularProductCardState extends State<PopularProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 25),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 150,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.9,
                child: InkWell(
                  onTap: (){
                    dashboardController.updateIndex(1);
                    productController.searchTextEditController.text = widget.product.name;
                    productController.searchVal.value = widget.product.name;
                    productController.getProductByName(keyword: widget.product.name);
                  },
                  child: CachedNetworkImage(
                    imageUrl: baseUrl+widget.product.images.first,
                    placeholder: (context,url) => Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey,
                      child: Container(
                        color: Colors.grey,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                          vertical: 32,
                          horizontal: 4
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.grey,
                      ),
                    )
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Text(
                  widget.product.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14
                  ),
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
