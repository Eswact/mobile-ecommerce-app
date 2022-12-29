/*import 'package:badges/badges.dart';*/
import 'package:flutter/material.dart';
import 'package:pedalim/controller/controllers.dart';
import 'package:get/get.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10
          )
        ]
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(24)
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(0,0),
                  blurRadius: 8
                )
              ]
            ),
            child: Obx(()=>TextField(
              style: const TextStyle(color: Colors.black),
              autofocus: false,
              controller: productController.searchTextEditController,
              onSubmitted: (val){
                productController.getProductByName(keyword: val);
                dashboardController.updateIndex(1); // herhangi bi sayfada arama yapıldığında arama sayfasına gönderme
              },
              onChanged: (val){
                productController.searchVal.value = val;
              },
              decoration: InputDecoration(
                  suffixIcon: productController.searchVal.value.isNotEmpty?  // boş değilse clear iconu çıkar tıklanırsa temizle
                  IconButton(
                    icon: Icon(Icons.clear, color: Theme.of(context).primaryColor),
                    onPressed: (){
                      FocusScope.of(context).requestFocus(FocusNode());
                      productController.searchTextEditController.clear();
                      productController.searchVal.value= '';
                      productController.getProducts();
                    },
                  ): null,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 16,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none
                  ),
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey)
              ),
            )),
          )),
          /*const SizedBox(width: 10),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  blurRadius: 8
                )
              ]
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.filter_alt_outlined,
                color: Color(0xffff8900)),
          ),*/
          /*const SizedBox(width: 10),
          Badge(
            badgeContent: Text("1",
              style: TextStyle(
                color: Colors.white
              ),),
            badgeColor: Theme.of(context).primaryColor,
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 8
                    )
                  ]
              ),
              padding: const EdgeInsets.all(12),
              child: const Icon(Icons.shopping_cart_outlined,
                  color: Colors.grey),
            ),
          ),*/
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}