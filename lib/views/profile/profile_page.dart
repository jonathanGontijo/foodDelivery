import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/common/custom_button.dart';
import 'package:foodly/common/custom_container.dart';
import 'package:foodly/controllers/login_controller.dart';
import 'package:foodly/models/login_response.dart';
import 'package:foodly/views/auth/login_redirect.dart';
import 'package:foodly/views/auth/verification_page.dart';
import 'package:foodly/views/profile/addresses_page.dart';
import 'package:foodly/views/profile/shipping_address.dart';
import 'package:foodly/views/profile/widget/profile_app_bar.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/views/profile/widget/profile_tile_widget.dart';
import 'package:foodly/views/profile/widget/user_info_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final controller = Get.put(LoginController());

    final box = GetStorage();

    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null) {
      return const LoginRedirect();
    }

    if (user != null && user.verification == false) {
      return const VerificationPage();
    }

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: const ProfileAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
            containerContent: Column(
          children: [
            UserInfoWidget(user: user),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 210.h,
              decoration: const BoxDecoration(
                color: kLightWhite,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProfileTileWidget(
                    onTap: () {},
                    title: "Orders",
                    icon: Ionicons.fast_food_outline,
                  ),
                  ProfileTileWidget(
                    onTap: () {},
                    title: "Favorite Places",
                    icon: Ionicons.heart_outline,
                  ),
                  ProfileTileWidget(
                    onTap: () {},
                    title: "Review",
                    icon: Ionicons.chatbubble_outline,
                  ),
                  ProfileTileWidget(
                    onTap: () {},
                    title: "Cuppons",
                    icon: MaterialCommunityIcons.tag_outline,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 210.h,
              decoration: const BoxDecoration(
                color: kLightWhite,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ProfileTileWidget(
                    onTap: () {
                      Get.to(() => const Addresses());
                    },
                    title: "Shipping Address",
                    icon: SimpleLineIcons.location_pin,
                  ),
                  ProfileTileWidget(
                    onTap: () {},
                    title: "Service Center",
                    icon: AntDesign.customerservice,
                  ),
                  ProfileTileWidget(
                    onTap: () {},
                    title: "App FeedBack",
                    icon: MaterialIcons.rss_feed,
                  ),
                  ProfileTileWidget(
                    onTap: () {},
                    title: "Settings",
                    icon: AntDesign.setting,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
              onTap: () {
                Get.to(() => const LoginRedirect());
              },
              btnWidth: width - 20,
              btnColor: kRed,
              text: "Logout",
              radius: 0,
            )
          ],
        )),
      ),
    );
  }
}
