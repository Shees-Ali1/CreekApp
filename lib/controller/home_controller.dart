import 'package:creekapp/const/assets/image_assets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxList<dynamic> bookListing=[
    {
      'bookImage':AppImages.harryPotterBook,
      'bookName':'Harry Potter and the cursed child',
      'bookPart':'Parts One And Two',
      'bookAuthor':'J.K. Rowling',
      'bookClass':'Graduate',
      'bookCondition':'New',
      'bookPrice':100,
      'bookPosted':'20 May 2025',
      'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. '
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
      'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. '
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
      'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. '
    },
    {
      'bookImage':AppImages.harryPotterBook,
      'bookName':'Harry Potter and the cursed child',
      'bookPart':'Parts One And Two',
      'bookAuthor':'J.K. Rowling',
      'bookClass':'Graduate',
      'bookCondition':'New',
      'bookPrice':100,
      'bookPosted':'20 May 2025',
      'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. '
    },



  ].obs;

  void removeBookListing(int index) {
    bookListing.removeAt(index);
    bookListing.refresh();
    update();
    Get.back();
    Get.snackbar('Success', "Listing Removed");
  }




}