// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:trackizer/core/shared/appbars/custom_appbar_text.dart';
import 'package:trackizer/features/home/data/models/user_model.dart';

import '../../../../core/config/theme/app_typography.dart'
    show AppText, TextRole;
import '../../../../core/const/app_sizes.dart';
import '../../../../core/const/assets.dart';
import '../../../../core/utils/tools.dart' show appColor;

class SettingPage extends StatelessWidget {
  const SettingPage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomTextAppBar(title: "Settings"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: Image.asset(Assets.assetsImgU1),
                  ),
                ),
                SizedBox(height: 8),
                //user.name
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'john',
                    style: TextStyle(color: appColor.onPrimary, fontSize: 20),
                  ),
                ),
                //user.email
                Align(
                  alignment: Alignment.center,

                  child: Text('john@gmail.com'),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColor.tertiaryContainer.withOpacity(
                        0.5,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Edit profile",
                      style: TextStyle(color: appColor.onPrimary),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SettingSectionCard(
                  title: "General",
                  tils: [
                    SettingData.navigation(
                      img: Assets.assetsImgFaceId,
                      title: "Security",
                      value: "Face ID",
                      onTap: () {},
                    ),
                    SettingData.toggle(
                      img: Assets.assetsImgIcloud,
                      title: "Icloud Sync",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SettingSectionCard(
                  title: "My subscriptions",
                  tils: [
                    SettingData.navigation(
                      img: Assets.assetsImgSorting,
                      title: "Sorting",
                      value: "Date",
                      onTap: () {},
                    ),
                    SettingData.navigation(
                      img: Assets.assetsImgChart,
                      title: "Summary",
                      value: "Avarage",
                      onTap: () {},
                    ),
                    SettingData.navigation(
                      img: Assets.assetsImgMoney,
                      title: "Default Currency",
                      value: "USD (\$)",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SettingSectionCard(
                  title: "Appearance",
                  tils: [
                    SettingData.navigation(
                      img: Assets.assetsImgAppIcon,
                      title: "App icon",
                      value: "Dafault",
                      onTap: () {},
                    ),
                    SettingData.navigation(
                      img: Assets.assetsImgSettings,
                      title: "Theme",
                      value: "Dark",
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- SettingTileData --- //
enum SettingType { navigation, toggle }

class SettingData {
  final String img;
  final String title;
  final String? value; //navigation
  final VoidCallback? onTap; //navigation
  final bool? toggle; //state toggle
  final ValueChanged<bool>? onToggle; //toggle
  final SettingType type;

  const SettingData.navigation({
    required this.img,
    required this.title,
    this.onTap,

    this.value,
  }) : type = SettingType.navigation,
       toggle = null,
       onToggle = null;

  const SettingData.toggle({
    required this.img,
    required this.title,
    this.toggle,
    this.onToggle,
  }) : type = SettingType.toggle,
       onTap = null,
       value = null;
}

class SettingSectionCard extends StatelessWidget {
  const SettingSectionCard({
    super.key,
    required this.title,
    required this.tils,
  });

  final String title;
  final List<SettingData> tils;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppText(title, role: TextRole.body),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: appColor.secondaryContainer.withOpacity(0.7),
            borderRadius: AppSizes.brL,
            border: Border.all(color: appColor.onPrimary.withOpacity(0.1)),
          ),
          padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
          child: Column(
            children: [
              ...List.generate(tils.length, (i) {
                final t = tils[i];
                final isLast = i == tils.length - 1;
                return Column(
                  children: [
                    SettingCard(data: t),
                    if (!isLast)
                      Divider(
                        height: 1,
                        thickness: 0.7,
                        indent: 56,
                        color: appColor.outline.withOpacity(0.12),
                      ),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}

class SettingCard extends StatelessWidget {
  const SettingCard({super.key, required this.data});

  final SettingData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: data.type == SettingType.navigation ? data.onTap : null,
      child: ListTile(
        minLeadingWidth: 0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 6),
        leading: Image.asset(data.img, width: 20, height: 20),
        title: AppText(
          data.title,
          role: TextRole.body,
          fontWeight: FontWeight.w400,
        ),
        trailing: data.type == SettingType.toggle
            ? Switch.adaptive(
                value: data.toggle ?? false,
                onChanged: data.onToggle,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    data.value ?? " ",
                    fontWeight: FontWeight.w400,
                    role: TextRole.body2,
                  ),
                  Icon(Icons.chevron_right, color: appColor.tertiaryContainer),
                ],
              ),
      ),
    );
  }
}
