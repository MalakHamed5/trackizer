// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element_parameter

import 'package:flutter/material.dart';
import 'package:trackizer/core/config/theme/app_typography.dart';
import 'package:trackizer/core/shared/appbars/custom_appbar_text.dart';
import 'package:trackizer/features/home/presentation/widgets/add_button.dart';
import 'package:trackizer/features/home/presentation/widgets/my_floationg_acion_button.dart';

import '../../../../core/config/routes/app_router.dart';
import '../../../../core/const/assets.dart';
import '../../../../core/utils/tools.dart';
import '../widgets/my_bottom_app_bar.dart';

class CardDemoPage extends StatelessWidget {
  const CardDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomTextAppBar(title: 'Card', showLeadingIcon: false),
      ),
      floatingActionButton: MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottmAppBar(currentPage: AppRouter.card),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: appH * 0.4,
              width: appW * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.assetsImgCardBlank),
                ),
              ),
              child: Column(
                children: [
                  sizeH(10),
                  Image.asset(
                    Assets.assetsImgMastercardLogo,
                    height: 60,
                    width: 60,
                  ),
                  sizeH(10),
                  AppText("Virtual Card"),
                  SizedBox(height: 90),
                  AppText(
                    "John Doe",
                    role: TextRole.body2,
                    fontWeight: FontWeight.w400,
                  ),
                  sizeH(10),
                  AppText("**** ***** **** 3434"),
                  sizeH(10),
                  AppText("08/29"),
                ],
              ),
            ),
            sizeH(20),
            AppText("Subscriptions"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Subscriptions(img: Assets.assetsImgSpotifyLogo),
                _Subscriptions(img: Assets.assetsImgYoutubeLogo),
                _Subscriptions(img: Assets.assetsImgOnedriveLogo),
                _Subscriptions(img: Assets.assetsImgNetflixLogo),
              ],
            ),
            sizeH(50),
            Container(height: 200, 
            decoration: BoxDecoration(
              color: appColor.secondaryContainer.withOpacity(0.5), 
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), 
                topRight: Radius.circular(25), 
              )
            ),child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 60),
              child: AddButton(title: "Add new card")),)
          ],
        ),
      ),
    );
  }
}

class _Subscriptions extends StatelessWidget {
  const _Subscriptions({super.key, required this.img});

  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: EdgeInsets.all(8),
      child: Image.asset(img),
    );
  }
}
