import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creekapp/Auth/login_view.dart';
import 'package:creekapp/controller/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  RxString userName = ''.obs;
  RxString userImage = ''.obs;
  RxString userEmail = ''.obs;
  RxString userSchool = ''.obs;
  RxString userPassword = ''.obs;
  RxList<dynamic> userPurchases = [].obs;
  final HomeController homeController = Get.put(HomeController());
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

  Future<void> fetchUserData() async {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        // Reference to the users collection
        CollectionReference usersCollection =
            FirebaseFirestore.instance.collection('userDetails');

        // Query to get the document with the specified UID
        DocumentSnapshot userInfo = await usersCollection
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();

        if (userInfo.exists) {
          userPurchases.clear();
          userName.value = userInfo["userName"] ?? "";
          userEmail.value = userInfo["userEmail"] ?? "";
          homeController.classOption.value = userInfo["userSchool"] ?? "";
          userPassword.value = userInfo['userPassword'];
          userImage.value = userInfo["userImage"] ?? "";
          userPurchases.value = userInfo['userPurchases'];


          update();
        } else {
          // User not found
        }
      } else {
        print("User not login");
      }
    } catch (e) {
      print('Error fetching user data: $e');
    } finally {
      update();
    }
  }

  Future<void> profileUpdate(TextEditingController nameController) async {
    try {
      await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'userName': nameController.text.trim(),
        'userSchool': homeController.classOption.value,
      });
      if (imageFile != null) {
        String img =
            await updateUserImage(FirebaseAuth.instance.currentUser!.uid);
        await FirebaseFirestore.instance
            .collection('userDetails')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'userImage': img});
        userImage.value = img;
      }
      userName.value = nameController.text;
      Get.back();
    } catch (e) {
      print('Error Updateing Profile $e');
    }
  }

  Future<String> updateUserImage(String userId) async {
    try {
      // Get a reference to the Firebase Storage location
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('$userId.jpg'); // You can customize the file name as needed

      // Upload the image
      UploadTask uploadTask = storageReference.putFile(imageFile!);
      TaskSnapshot taskSnapshot = await uploadTask;

      // Get the download URL of the uploaded image
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      throw e;
    }
  }

//   ************Get user history sell
  List<dynamic> bookId = [];
  List<dynamic> booksSale = [];
  RxInt saleSum = 0.obs;
  Future<void> getSellHistory() async {
    try {
      bookId.clear();
      booksSale.clear();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('booksListing')
          .where('sellerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((booksList) async {
          bookId.add(booksList['listingId']);
        });
        bookId.forEach((ids) async {
          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
              .collection('booksListing')
              .doc(ids)
              .collection('orders')
              .get();
          if (querySnapshot.docs.isNotEmpty) {
            // print(querySnapshot.docs.length);
            booksSale.add(querySnapshot.docs.length);
            print(booksSale);
            saleSum.value = booksSale.reduce((a, b) => a + b);
            update();
          } else {
            print('no orders');
          }
        });
      } else {
        print('no listing or seller listing found');
      }
    } catch (e) {
      print("error getting sales $e");
    }
  }

  Future<void> changePassword(TextEditingController password) async {
    try {
      final AuthCredential credential = EmailAuthProvider.credential(
        email: userEmail.value,
        password: userPassword.value,
      );

      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return;
      }

      UserCredential reauthenticatedUser =
          await currentUser.reauthenticateWithCredential(credential);

      User? user = reauthenticatedUser.user;
      if (user == null) {
        return;
      }

      await user.updatePassword(password.text);
      await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(user.uid)
          .update({
        'userPassword': password.text,
      });
      // await FirebaseAuth.instance.signOut();

      Get.snackbar("Success", "Password updated successfully");
    } catch (error) {
      print('Error updating password');
    }
  }
  Future<void>deleteAccont()async{
   try{
     final AuthCredential credential = EmailAuthProvider.credential(
       email: userEmail.value,
       password: userPassword.value,
     );

     final currentUser = FirebaseAuth.instance.currentUser;
     if (currentUser == null) {
       return;
     }

     UserCredential reauthenticatedUser =
     await currentUser.reauthenticateWithCredential(credential);

     User? user = reauthenticatedUser.user;
     if (user == null) {
       return;
     }
     await FirebaseAuth.instance.currentUser?.delete();
     Get.offAll(LoginView());
   }catch(e){
     print('Error Deleting Account$e');
   }

  }
  checkIfAccountIsDeleted() async {
    try {
      IdTokenResult? idTokenResult =
      await FirebaseAuth.instance.currentUser?.getIdTokenResult(true);

      if (idTokenResult == null || idTokenResult.token == null) {
        print("User is deleted");
          await FirebaseAuth.instance.signOut();
          Get.offAll(LoginView());
        // do logout stuff here...
      } else {
        print("User is available");
      }
    } catch (er) {
      print("User is deleted");
      await FirebaseAuth.instance.signOut();
      Get.offAll(LoginView());
    }
  }
}
