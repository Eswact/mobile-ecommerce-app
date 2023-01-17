import 'package:pedalim/model/category.dart';
import 'package:pedalim/model/product.dart';
import 'package:pedalim/service/local_service/local_ad_banner_service.dart';
import 'package:pedalim/service/local_service/local_category_service.dart';
import 'package:pedalim/service/local_service/local_product_service.dart';
import 'package:pedalim/service/remote_service/remote_banner_service.dart';
import 'package:pedalim/service/remote_service/remote_popular_category_service.dart';
import 'package:pedalim/service/remote_service/remote_popular_product_service.dart';
import 'package:get/get.dart';
import 'package:pedalim/model/ad_banner.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList = List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;
  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  final LocalProductService _localProductService = LocalProductService();


  @override
  Future<void> onInit() async {
    await _localAdBannerService.init();
    await _localCategoryService.init();
    await _localProductService.init();
    getAdBanners();
    getPopularCategories();
    getPopularProducts();
    super.onInit();
  }

  void getAdBanners() async{
    try{
      isBannerLoading(true);
      //eğer local veritabanında kayıtlı banner varsa ordan yükle 
      if(_localAdBannerService.getAdBanners().isNotEmpty){
        bannerList.assignAll(_localAdBannerService.getAdBanners());
      }
      //api'ye istek
      var result = await RemoteBannerService().get();
      if (result != null){
        //api cevaplarını yükle
        bannerList.assignAll(adBannerListFromJson(result.body));
        //api cevaplarını local veritabanına kaydet
        _localAdBannerService.assignAllAdBanners(adBanners: adBannerListFromJson(result.body));
      }
    } finally {
      isBannerLoading(false);
    }
  }

  void getPopularCategories() async{
    try{
      isPopularCategoryLoading(true);
      //assigning local popular categories before call api
      if(_localCategoryService.getPopularCategories().isNotEmpty){
        popularCategoryList.assignAll(_localCategoryService.getPopularCategories());
      }
      //cal api
      var result = await RemotePopularCategoryService().get();
      if (result != null){
        //assign api result
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
        //save api result to local db
        _localCategoryService.assignAllPopularCategories(popularCategories: popularCategoryListFromJson(result.body));
      }
    } finally {
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProducts() async{
    try{
      isPopularProductLoading(true);
      //assigning local popular products before call api
      if(_localProductService.getPopularProducts().isNotEmpty){
        popularProductList.assignAll(_localProductService.getPopularProducts());
      }
      //cal api
      var result = await RemotePopularProductService().get();
      if (result != null){
        //assign api result
        popularProductList.assignAll(popularProductListFromJson(result.body));
        //save api result to local db
        _localProductService.assignAllPopularProducts(popularProducts: popularProductListFromJson(result.body));
      }
    } finally {
      isPopularProductLoading(false);
    }
  }
}