import 'package:creekapp/const/color.dart';
import 'package:creekapp/controller/user_controller.dart';
import 'package:creekapp/view/chat_screen/main_chat.dart';
import 'package:creekapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../const/assets/image_assets.dart';
import '../../../const/assets/svg_assets.dart';
import '../../../controller/home_controller.dart';
import '../../../controller/login_auth_controller.dart';
import '../../../widgets/custom _backbutton.dart';
import '../../../widgets/custom_route.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/password_field.dart';
import '../../notification/notification_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final LoginAuthController loginVM = Get.find<LoginAuthController>();

  final HomeController homeController = Get.find<HomeController>();

  final UserController userController = Get.find<UserController>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = userController.userName.value;
    emailController.text = userController.userEmail.value;
    userController.imageFile=null;



  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(children: [
        ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
                height: 160.h,
                // padding: EdgeInsets.symmetric(vertical: 50.h),
                decoration: const BoxDecoration(
                    color: Color(0xff29604E),
                    image: DecorationImage(
                        image: AssetImage(AppImages.appbardesign),
                        fit: BoxFit.cover)),
                child: SafeArea(
                  child: Column(children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      const CustomBackButton(),
                      SizedBox(
                        width: 20.w,
                      ),
                      InterCustomText(
                        text: 'Edit Profile',
                        textColor: Colors.white,
                        fontsize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            CustomRoute.navigateTo(context, const MainChat());
                          },
                          child: SvgPicture.asset(AppIcons.chaticon)),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                          onTap: () {
                            CustomRoute.navigateTo(
                                context, const NotificationScreen());
                          },
                          child: SvgPicture.asset(AppIcons.notificationIcon)),
                      SizedBox(
                        width: 23.w,
                      ),
                    ]),
                  ]),
                )))
      ]),
      SizedBox(
        height: 17.h,
      ),
      Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GetBuilder<UserController>(builder: (userController) {
              return  userController.imageFile==null?
              userController.userImage.value != null
                  ? Container(
                      height: 106.78.h,
                      width: 106.78.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                              image: NetworkImage(
                                userController.userImage.value,
                                // height: 14.h,
                                // width: 26.w,
                              ),
                              fit: BoxFit.cover)),
                    )
                  :Image.asset(
                      AppImages.profile,
                      height: 106.h,
                      width: 106.w,
                    ):Container(
                height: 106.78.h,
                width: 106.78.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                        image: FileImage(
                         userController.imageFile!
                          // height: 14.h,
                          // width: 26.w,
                        ),
                        fit: BoxFit.cover)),
              );
            }),
            Positioned(
                right: 0,
                bottom: -5,
                child: GestureDetector(
                    onTap: () {
                      userController.pickImage();
                    },
                    child: SvgPicture.asset(AppIcons.editcameraIcon)))
          ],
        ),
      ),
      SizedBox(
        height: 15.h,
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LexendCustomText(
              text: 'Name',
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              textColor: const Color(0xff1E1E1E),
            ),
            SizedBox(
              height: 8.h,
            ),
            InputField(
              controller: nameController,
              hint: 'Enter Name',
              keyboard: TextInputType.emailAddress,
              hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black54),
            ),
            SizedBox(
              height: 8.h,
            ),
            LexendCustomText(
              text: 'Email Address',
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              textColor: const Color(0xff1E1E1E),
            ),
            SizedBox(
              height: 8.h,
            ),
            InputField(
              readOnly: true,
              controller: emailController,
              hint: 'Enter Email Address',
              keyboard: TextInputType.emailAddress,
              hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black54),
            ),
            SizedBox(
              height: 8.h,
            ),
            LexendCustomText(
              text: 'School Name',
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              textColor: const Color(0xff1E1E1E),
            ),
            SizedBox(
              height: 8.h,
            ),
            Obx(() {
              return Container(
                height: 50.h,
                width: 327.w,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20.r)),
                child: DropdownButton<String>(
                    underline: const SizedBox.shrink(),
                    isExpanded: true,
                    value: homeController.classOption.value,
                    items: homeController.bookClass.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: LexendCustomText(
                            text: option,
                            textColor: Colors.black,
                            fontWeight: FontWeight.w400),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // homeController.bookClass.value=newValue!;
                      homeController.classOption.value = newValue!;
                    },
                    hint: const SizedBox.shrink()),
              );
            }),
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            //   width: double.infinity,
            //   height: 58.h,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20.r),
            //     color: Color(0xff29604E).withOpacity(0.06),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       LexendCustomText(
            //         text: 'Harker',
            //         fontWeight: FontWeight.w400,
            //         fontsize: 16.sp,
            //         textColor: Colors.black,
            //       ),
            //       Icon(Icons.keyboard_arrow_down)
            //     ],
            //   ),
            // ),
            // InputField(
            //   controller: nameController,
            //   hint: 'Enter Name',
            //   keyboard: TextInputType.emailAddress,
            //   hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black54),
            // ),
            SizedBox(
              height: 8.h,
            ),
            LexendCustomText(
              text: 'Password',
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              textColor: const Color(0xff1E1E1E),
            ),
            SizedBox(
              height: 8.h,
            ),
            Obx(() {
              return PasswordField(
                onTap: () => loginVM.eyeIconLogin(),
                controller: passwordController,
                keyboard: TextInputType.text,
                isObscure: !loginVM.loginObscure.value,
                trailIcon: loginVM.loginObscure.value
                    ? SvgPicture.asset(AppIcons.passwordeyeIcon)
                    : const Icon(
                        Icons.visibility_off_outlined,
                        size: 20,
                      ),
                hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black54),
                hint: 'Enter Password',
              );
            }),
            SizedBox(
              height: 38.h,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        width: double.infinity,
                        // height: 250.h,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              width: 30.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(4.r)),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            WorkSansCustomText(
                              text: 'Confirm changes?',
                              fontWeight: FontWeight.w600,
                              textColor: Colors.black,
                              fontsize: 20.sp,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            WorkSansCustomText(
                              text:
                                  'They will be sent to admin team to be approved again',
                              fontWeight: FontWeight.w400,
                              textColor: Colors.black,
                              fontsize: 12.sp,
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            CustomButton(
                                text: 'Yes',
                                onPressed: () {
                                  userController.profileUpdate(nameController);
                                },
                                backgroundColor: primaryColor,
                                textColor: whiteColor),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomButton(
                                text: 'Back',
                                onPressed: () {},
                                backgroundColor: primaryColor.withOpacity(0.2),
                                textColor: whiteColor),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                width: double.infinity,
                height: 58.h,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: LexendCustomText(
                    text: 'Change',
                    fontWeight: FontWeight.w500,
                    fontsize: 16.sp,
                    textColor: whiteColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ])));
  }
}
