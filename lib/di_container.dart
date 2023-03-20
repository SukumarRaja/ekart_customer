import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:ekart/data/datasource/remote/dio/dio_client.dart';
import 'package:ekart/data/repository/auth_repo.dart';
import 'package:ekart/data/repository/banner_repo.dart';
import 'package:ekart/data/repository/brand_repo.dart';
import 'package:ekart/data/repository/cart_repo.dart';
import 'package:ekart/data/repository/category_repo.dart';
import 'package:ekart/data/repository/chat_repo.dart';
import 'package:ekart/data/repository/coupon_repo.dart';
import 'package:ekart/data/repository/featured_deal_repo.dart';
import 'package:ekart/data/repository/flash_deal_repo.dart';
import 'package:ekart/data/repository/location_repo.dart';
import 'package:ekart/data/repository/notification_repo.dart';
import 'package:ekart/data/repository/onboarding_repo.dart';
import 'package:ekart/data/repository/product_details_repo.dart';
import 'package:ekart/data/repository/order_repo.dart';
import 'package:ekart/data/repository/product_repo.dart';
import 'package:ekart/data/repository/profile_repo.dart';
import 'package:ekart/data/repository/search_repo.dart';
import 'package:ekart/data/repository/seller_repo.dart';
import 'package:ekart/data/repository/splash_repo.dart';
import 'package:ekart/data/repository/support_ticket_repo.dart';
import 'package:ekart/data/repository/top_seller_repo.dart';
import 'package:ekart/data/repository/wallet_transaction_repo.dart';
import 'package:ekart/data/repository/wishlist_repo.dart';
import 'package:ekart/helper/network_info.dart';
import 'package:ekart/provider/auth_provider.dart';
import 'package:ekart/provider/banner_provider.dart';
import 'package:ekart/provider/brand_provider.dart';
import 'package:ekart/provider/cart_provider.dart';
import 'package:ekart/provider/category_provider.dart';
import 'package:ekart/provider/chat_provider.dart';
import 'package:ekart/provider/coupon_provider.dart';
import 'package:ekart/provider/facebook_login_provider.dart';
import 'package:ekart/provider/featured_deal_provider.dart';
import 'package:ekart/provider/flash_deal_provider.dart';
import 'package:ekart/provider/google_sign_in_provider.dart';
import 'package:ekart/provider/home_category_product_provider.dart';
import 'package:ekart/provider/localization_provider.dart';
import 'package:ekart/provider/location_provider.dart';
import 'package:ekart/provider/notification_provider.dart';
import 'package:ekart/provider/onboarding_provider.dart';
import 'package:ekart/provider/product_details_provider.dart';
import 'package:ekart/provider/order_provider.dart';
import 'package:ekart/provider/product_provider.dart';
import 'package:ekart/provider/profile_provider.dart';
import 'package:ekart/provider/search_provider.dart';
import 'package:ekart/provider/seller_provider.dart';
import 'package:ekart/provider/splash_provider.dart';
import 'package:ekart/provider/support_ticket_provider.dart';
import 'package:ekart/provider/theme_provider.dart';
import 'package:ekart/provider/top_seller_provider.dart';
import 'package:ekart/provider/wallet_transaction_provider.dart';
import 'package:ekart/provider/wishlist_provider.dart';
import 'package:ekart/utill/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/config.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repository/home_category_product_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConfig.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => CategoryRepo(dioClient: sl()));
  sl.registerLazySingleton(() => HomeCategoryProductRepo(dioClient: sl()));
  sl.registerLazySingleton(() => TopSellerRepo(dioClient: sl()));
  sl.registerLazySingleton(() => FlashDealRepo(dioClient: sl()));
  sl.registerLazySingleton(() => FeaturedDealRepo(dioClient: sl()));
  sl.registerLazySingleton(() => BrandRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ProductRepo(dioClient: sl()));
  sl.registerLazySingleton(() => BannerRepo(dioClient: sl()));
  sl.registerLazySingleton(() => OnBoardingRepo(dioClient: sl()));
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => ProductDetailsRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SearchRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => OrderRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SellerRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CouponRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ChatRepo(dioClient: sl()));
  sl.registerLazySingleton(() => NotificationRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ProfileRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => WishListRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CartRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => SupportTicketRepo(dioClient: sl()));
  sl.registerLazySingleton(() => LocationRepo(dioClient: sl()));
  sl.registerLazySingleton(() => WalletTransactionRepo(dioClient: sl()));

  // Provider
  sl.registerFactory(() => CategoryProvider(categoryRepo: sl()));
  sl.registerFactory(() => HomeCategoryProductProvider(homeCategoryProductRepo: sl()));
  sl.registerFactory(() => TopSellerProvider(topSellerRepo: sl()));
  sl.registerFactory(() => FlashDealProvider(megaDealRepo: sl()));
  sl.registerFactory(() => FeaturedDealProvider(featuredDealRepo: sl()));
  sl.registerFactory(() => BrandProvider(brandRepo: sl()));
  sl.registerFactory(() => ProductProvider(productRepo: sl()));
  sl.registerFactory(() => BannerProvider(bannerRepo: sl()));
  sl.registerFactory(() => OnBoardingProvider(onboardingRepo: sl()));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => ProductDetailsProvider(productDetailsRepo: sl()));
  sl.registerFactory(() => SearchProvider(searchRepo: sl()));
  sl.registerFactory(() => OrderProvider(orderRepo: sl()));
  sl.registerFactory(() => SellerProvider(sellerRepo: sl()));
  sl.registerFactory(() => CouponProvider(couponRepo: sl()));
  sl.registerFactory(() => ChatProvider(chatRepo: sl()));
  sl.registerFactory(() => NotificationProvider(notificationRepo: sl()));
  sl.registerFactory(() => ProfileProvider(profileRepo: sl()));
  sl.registerFactory(() => WishListProvider(wishListRepo: sl(), productDetailsRepo: sl()));
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => CartProvider(cartRepo: sl()));
  sl.registerFactory(() => SupportTicketProvider(supportTicketRepo: sl()));
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl(), dioClient: sl()));
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => GoogleSignInProvider());
  sl.registerFactory(() => FacebookLoginProvider());
  sl.registerFactory(() => LocationProvider(sharedPreferences: sl(), locationRepo: sl()));
  sl.registerFactory(() => WalletTransactionProvider(transactionRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}
