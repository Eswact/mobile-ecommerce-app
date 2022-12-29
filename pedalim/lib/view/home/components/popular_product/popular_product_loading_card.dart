import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularProductLoadingCard extends StatelessWidget {
  const PopularProductLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 5),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey.shade300,
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 190,
            child: Column(
              children: [
                AspectRatio(aspectRatio: 0.9,
                  child: Container(
                    color: Colors.grey,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: 4
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 2, bottom: 2),
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
