import 'package:flutter/material.dart';
import '../../../controller/controllers.dart';

class SectionTitleForProduct extends StatelessWidget {
  final String title;
  const SectionTitleForProduct ({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.black87),
          ),
          TextButton(
              child: const Text(
                "Tümünü gör",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              onPressed: () {
                dashboardController.updateIndex(1);
              }
          ),
        ],
      ),
    );
  }
}
