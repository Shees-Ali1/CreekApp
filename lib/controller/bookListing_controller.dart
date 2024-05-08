import 'dart:io';

import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:creekapp/view/sell_screens/approval_sell_screen.dart';
import 'package:creekapp/widgets/custom_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BookListingController extends GetxController{
  final HomeController homeController=Get.find<HomeController>();
  final TextEditingController titleController=TextEditingController();
  final TextEditingController bookPartController=TextEditingController();
  final TextEditingController authorController=TextEditingController();
  final TextEditingController classNameController=TextEditingController();
  final TextEditingController priceController=TextEditingController();
  RxString bookCondition='New'.obs;
  List<String> bookConditions = ['New','Used','Old'];
  File? imageFile;
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      update();

    }
  }

  RxList<dynamic> mySellListings=[
    {
      'bookImage':AppImages.harryPotterBook,
      'bookName':'Harry Potter and the cursed child',
      'bookPart':'Parts One And Two',
      'bookAuthor':'J.K. Rowling',
      'bookClass':'Graduate',
      'bookCondition':'New',
      'bookPrice':100,
      'bookPosted':'20 May 2025',
      'sellerId':'qwerty',

      'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. ',
      'approval':false,
    },
    {
      'bookImage':AppImages.soulBook,
      'bookName':'Soul',
      'bookPart':'',
      'bookAuthor':' Olivia Wilson',
      'bookClass':'Graduate',
      'bookCondition':'New',
      'bookPrice':100,
      'bookPosted':'20 May 2025',
      'sellerId':'qwerty',

      'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. ',
      'approval':true,

    },
    {
      'bookImage':AppImages.milliontoone ,
      'bookName':'A MILLION TO ONE',
      'bookPart':'The Fassano Trilogy - Book Two',
      'bookAuthor':'Tony Faggioli',
      'bookClass':'Graduate',
      'bookCondition':'Used',
      'bookPrice':70,
      'bookPosted':'20 May 2025',
      'sellerId':'qwerty',
      'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. ',
      'approval':true,

    },


  ].obs;
  void addBookListing(BuildContext context){
    if(titleController.text.isNotEmpty){
      mySellListings.add({
        'bookImage':AppImages.harryPotterBook,
        'bookName':titleController.text,
        'bookPart':bookPartController.text,
        'bookAuthor':authorController.text,
        'bookClass':classNameController.text,
        'bookCondition':bookCondition,
        'bookPrice':priceController.text,
        'bookPosted':'20 May 2025',
        'sellerId':'qwerty',

        'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. ',
        'approval':false,
      },);

      mySellListings.refresh();
      update();
      // Get.back();
      Get.snackbar('Success', "Book Listing Added");
      CustomRoute.navigateTo(context, ApprovalSellScreen());
      titleController.clear();
      bookPartController.clear();
      authorController.clear();
      classNameController.clear();
      priceController.clear();

    }else{
      Get.snackbar('Missing Values', "Enter All Fields");

    }

  }
  void removeListingfromSell(int index){
   try{
     mySellListings.removeAt(index);
     mySellListings.refresh();
     update();
      Get.back();
     Get.snackbar('Success', "Listing Removed");
   }catch(e){
     print("Error deleting user lisitng $e");

   }
  }



}