import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creekapp/const/assets/image_assets.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:creekapp/view/sell_screens/approval_sell_screen.dart';
import 'package:creekapp/widgets/custom_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BookListingController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bookPartController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController classNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  // final user=FirebaseAuth.instance.currentUser!.uid;
  RxString bookCondition = 'New'.obs;
  List<String> bookConditions = ['New', 'Used', 'Old'];
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

  // RxList<dynamic> mySellListings=[
  //   {
  //     'bookImage':AppImages.harryPotterBook,
  //     'bookName':'Harry Potter and the cursed child',
  //     'bookPart':'Parts One And Two',
  //     'bookAuthor':'J.K. Rowling',
  //     'bookClass':'Graduate',
  //     'bookCondition':'New',
  //     'bookPrice':100,
  //     'bookPosted':'20 May 2025',
  //     'sellerId':'qwerty',
  //
  //     'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. ',
  //     'approval':false,
  //   },
  //   {
  //     'bookImage':AppImages.soulBook,
  //     'bookName':'Soul',
  //     'bookPart':'',
  //     'bookAuthor':' Olivia Wilson',
  //     'bookClass':'Graduate',
  //     'bookCondition':'New',
  //     'bookPrice':100,
  //     'bookPosted':'20 May 2025',
  //     'sellerId':'qwerty',
  //
  //     'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. ',
  //     'approval':true,
  //
  //   },
  //   {
  //     'bookImage':AppImages.milliontoone ,
  //     'bookName':'A MILLION TO ONE',
  //     'bookPart':'The Fassano Trilogy - Book Two',
  //     'bookAuthor':'Tony Faggioli',
  //     'bookClass':'Graduate',
  //     'bookCondition':'Used',
  //     'bookPrice':70,
  //     'bookPosted':'20 May 2025',
  //     'sellerId':'qwerty',
  //     'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. ',
  //     'approval':true,
  //
  //   },
  //
  //
  // ].obs;
  RxList<Map<String, dynamic>> mySellListings = <Map<String, dynamic>>[].obs;

  // **************Store book listing by user**********
  Future<void> addBookListing(BuildContext context) async {
    try {
      if (titleController.text.isNotEmpty &&
          priceController.text.isNotEmpty &&
          classNameController.text.isNotEmpty &&
          authorController.text.isNotEmpty) {
        // mySellListings.add({
        //   'bookImage':AppImages.harryPotterBook,
        //   'bookName':titleController.text,
        //   'bookPart':bookPartController.text,
        //   'bookAuthor':authorController.text,
        //   'bookClass':classNameController.text,
        //   'bookCondition':bookCondition,
        //   'bookPrice':priceController.text,
        //   'bookPosted':'20 May 2025',
        //   'sellerId':'qwerty',
        //
        //   'bookDescription':'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. ',
        //   'approval':false,
        // },);
        DocumentReference bookId =
            await FirebaseFirestore.instance.collection('booksListing').add({
          'bookImage':
              "https://img.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg?size=338&ext=jpg&ga=GA1.1.1224184972.1715212800&semt=sph",
          'bookName': titleController.text,
          'bookPart': bookPartController.text,
          'bookAuthor': authorController.text,
          'bookClass': classNameController.text,
          'bookCondition': bookCondition.value,
          'bookPrice': int.tryParse(priceController.text) ?? 0,
          'bookPosted': DateTime.now(),
          'sellerId': 'qwerty',
          'bookDescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing malesuada sed imperdiet pharetra, quis et a. Purus sed purus sed proin ornare integer proin lectus. Ut in purus mi, cursus integer et massa. Posuere turpis nulla odio eget auctor nulla lorem. ',
          'approval': false,
        });
        await FirebaseFirestore.instance
            .collection('booksListing')
            .doc(bookId.id)
            .set({
          'listingId': bookId.id,
        }, SetOptions(merge: true));
        // mySellListings.refresh();
        // update();
        // Get.back();
        Get.snackbar('Success', "Book Listing Added");
        CustomRoute.navigateTo(context, ApprovalSellScreen());
       await fetchUserBookListing();
        titleController.clear();
        bookPartController.clear();
        authorController.clear();
        classNameController.clear();
        priceController.clear();
      } else {
        Get.snackbar('Missing Values', "Enter All Fields");
      }
    } catch (e) {
      print("Error listing book $e");
    }
  }

  // **************Fetch book listings of that user**********
  Future<void> fetchUserBookListing() async {
    try {
      mySellListings.clear();
      QuerySnapshot listingsData = await FirebaseFirestore.instance
          .collection('booksListing')
          .where('sellerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (listingsData.docs.isNotEmpty) {
        listingsData.docs.forEach((book) {
          dynamic bookData = book.data();
          mySellListings.add({
            'bookImage': bookData['bookImage'],
            'bookName': bookData['bookName'],
            'bookPart': bookData['bookPart'],
            'bookAuthor': bookData['bookAuthor'],
            'bookClass': bookData['bookClass'],
            'bookCondition': bookData['bookCondition'],
            'bookPrice': bookData['bookPrice'],
            'bookPosted': bookData['bookPosted'],
            'sellerId': bookData['sellerId'],
            'bookDescription': bookData['bookDescription'],
            'approval': bookData['approval'],
            'listingId':bookData['listingId']
          });
        });
        print('Current User sell listings ${mySellListings}');
      } else {
        print("No user listings found");
      }
    } catch (e) {
      print("Error fetch user listings $e");
    }
  }

  // **************remove book listings of that user**********
  void removeListingfromSell(int index, String listingId) async {
    try {
      await FirebaseFirestore.instance
          .collection('booksListing')
          .doc(listingId)
          .delete();
      mySellListings.removeAt(index);
      mySellListings.refresh();
      update();
      Get.back();
      Get.snackbar('Success', "Listing Removed");
    } catch (e) {
      print("Error deleting user lisitng $e");
    }
  }


}
