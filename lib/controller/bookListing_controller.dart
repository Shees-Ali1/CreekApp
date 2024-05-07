import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:get/get.dart';

class BookListingController extends GetxController{
  final HomeController homeController=Get.find();
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

  void addBookListing(){
    mySellListings.add({
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
      },);



    mySellListings.refresh();
    update();
    // Get.back();
    Get.snackbar('Success', "Book Listing Added");
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
RxString bookCondition='New'.obs;
  List<String> bookConditions = ['New','Used','Old'];

}