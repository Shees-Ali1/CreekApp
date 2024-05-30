import 'package:creekapp/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../const/assets/image_assets.dart';
import '../../../const/assets/svg_assets.dart';
import '../../../controller/home_controller.dart';
import '../../../widgets/custom _backbutton.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_text.dart';

class TermCond extends StatelessWidget {
  const TermCond({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return  Scaffold(
        appBar: CustomAppBar1(
          homeController: homeController,
          text: 'Terms and Conditions',
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(

                    'Welcome to Creek!\n\n'
                        'These terms and conditions outline the rules and regulations for the use of Creek\'s App.\n\n'
                        'By accessing this app we assume you accept these terms and conditions. Do not continue to use Creek if you do not agree to take all of the terms and conditions stated on this page.\n\n'
                        'The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice, and all Agreements: "Client", "You" and "Your" refers to you, the person log on this app and compliant to the Company’s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance, and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization, and/or he/she or they, are taken as interchangeable and therefore as referring to same.\n\n'
                        'Cookies\n'
                        'We employ the use of cookies. By accessing Creek, you agreed to use cookies in agreement with the Creek\'s Privacy Policy.\n\n'
                        'License\n'
                        'Unless otherwise stated, Creek and/or its licensors own the intellectual property rights for all material on Creek. All intellectual property rights are reserved. You may access this from Creek for your own personal use subjected to restrictions set in these terms and conditions.\n\n'
                        'You must not:\n'
                        'Republish material from Creek\n'
                        'Sell, rent or sub-license material from Creek\n'
                        'Reproduce, duplicate or copy material from Creek\n'
                        'Redistribute content from Creek\n\n'
                        'This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the Terms And Conditions Template.\n\n'
                        'Parts of this app offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Creek does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Creek,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Creek shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this app.\n\n'
                        'Creek reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.\n\n'
                        'You warrant and represent that:\n'
                        'You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;\n'
                        'The Comments do not invade any intellectual property right, including without limitation copyright, trademark, patent, trade secret, or other proprietary right of any third party;\n'
                        'The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy\n'
                        'The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.\n\n'
                        'You hereby grant SeamlessAction a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.\n',
                    style: TextStyle(fontSize: 16.sp,color: primaryColor),
                  ),




                  // Add more Text widgets for the rest of the policy...
                ],
              ),
            ),
          ),
        ),
    );
  }
}
