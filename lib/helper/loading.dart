import 'package:creekapp/controller/user_controller.dart';
import 'package:creekapp/controller/wallet_controller.dart';
import 'package:get/get.dart';

import '../controller/bookListing_controller.dart';
import '../controller/home_controller.dart';


final UserController userController = Get.put(UserController());
final HomeController homeController = Get.put(HomeController());
final BookListingController bookListingController = Get.put(BookListingController());
final WalletController walletController = Get.put(WalletController());