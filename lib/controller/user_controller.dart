import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
          userName.value = userInfo["userName"] ?? "";
          userEmail.value = userInfo["userEmail"] ?? "";
          userImage.value = userInfo["userImage"] ?? "";
          homeController.classOption.value = userInfo["userSchool"] ?? "";
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
      if(imageFile!=null){
        String img=await updateUserImage(FirebaseAuth.instance.currentUser!.uid);
        await FirebaseFirestore.instance
            .collection('userDetails')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
        'userImage':img

        });
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
}
