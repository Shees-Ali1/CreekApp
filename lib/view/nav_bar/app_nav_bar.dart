import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:creekapp/const/assets/svg_assets.dart';
import 'package:creekapp/view/home_screen/home_screen_books.dart';
import 'package:creekapp/view/sell_screens/book_sell_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../const/color.dart';
import '../profile_screen/profile.dart';
import '../wallet/wallet.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({Key? key}) : super(key: key);

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  final _pageController = PageController(initialPage: 0);
  // notificationServices services = notificationServices();

  final _controller = NotchBottomBarController(index: 0);
  // final UserController userController = Get.put(UserController());
  // final JoinChatController joinchat_controller = Get.put(JoinChatController());

  int maxCount = 4;
  @override
  void initState() {
    super.initState();
    // services.sendnotificationPermission();
    // int arg =Get.arguments ?? 1;
    // print('argument$arg');
    // _navigateToPage(arg);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  List<Widget> bottomBarPages = [
    const HomeScreenBooks(),
    const BookSellScreen(),
    const Wallet(),
    const Profile(),
  ];
  // final NavBarController navBarController = Get.put(NavBarController());

  void _navigateToPage(int pageIndex) {
    _pageController.jumpToPage(pageIndex);
    _controller.jumpTo(pageIndex);
    Navigator.pop(context); // Close the drawer after navigation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: false,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(

        showBlurBottomBar: false,
        showShadow: false,
        itemLabelStyle: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.w400,
          fontSize: 11.sp,
        ),
        blurFilterY: 10,
        blurFilterX: 10,

        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        notchColor: primaryColor,
        color: primaryColor,
        showLabel: true,
        shadowElevation: 0,
        kBottomRadius: 15.0,

        removeMargins: false,
        durationInMilliSeconds: 300,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppIcons.shopping),
            activeItem: SvgPicture.asset(
              AppIcons.shopping,
              color: Colors.white,
            ),
            itemLabel: 'Buy',
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppIcons.disc),
            activeItem: SvgPicture.asset(
              AppIcons.disc,
              color: Colors.white,
            ),
            itemLabel: 'Sell',
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppIcons.dollar),
            activeItem: Center(
              child: SvgPicture.asset(
                AppIcons.dollar,
                color: Colors.white,
                alignment: Alignment.center,
              ),
            ),
            itemLabel: 'Wallet',
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppIcons.profile),
            activeItem: SvgPicture.asset(
              AppIcons.profile,
              color: Colors.white,
            ),
            itemLabel: 'Me',
          ),
        ],
        onTap: (index) {
          /// perform action on tab change and to update pages you can update pages without pages
          // log('current selected index $index');
          // joinchat_controller.comingfromhome.value=false;
          _pageController.jumpToPage(index);
        },
        kIconSize: 23.sp,
      )
          : null,
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow, child: const Center(child: Text('Page 1')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreenAccent,
        child: const Center(child: Text('Page 5')));
  }
}
