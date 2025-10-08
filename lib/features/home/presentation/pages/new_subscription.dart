// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trackizer/core/shared/buttons/primary_btn.dart';
import 'package:trackizer/core/utils/loggers.dart';
import 'package:trackizer/features/home/data/models/new_sub_model.dart';

import '../../../../core/const/assets.dart';
import '../../../../core/shared/appbars/custom_appbar_text.dart';
import '../../../../core/utils/tools.dart';

class NewSubscription extends StatefulWidget {
  const NewSubscription({super.key});

  @override
  State<NewSubscription> createState() => _NewSubscriptionState();
}

//---Data
List<NewSubModel> sub = [
  NewSubModel(img: Assets.assetsImgHboLogo, title: "HGBO Go"),
  NewSubModel(img: Assets.assetsImgSpotifyLogo, title: "Spotify"),
  NewSubModel(img: Assets.assetsImgOnedriveLogo, title: "OneDrive"),
];

class _NewSubscriptionState extends State<NewSubscription> {
  late final PageController _pageController;
  final double _amounVal = 0.06;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.6, initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar ---//
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomTextAppBar(title: 'New'),
      ),
      // --- Body ---//
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            //--- Add new sub
            SliverToBoxAdapter(
              child: Container(
                height: appH * 0.42,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: appColor.secondaryContainer.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Add new\nsubscription',
                      style: TextStyle(
                        fontSize: 36,
                        color: appColor.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                      child: PageView.builder(
                        padEnds: true,
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: sub.length,
                        itemBuilder: (context, i) {
                          return AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              double scale = 1.0;
                              if (_pageController.hasClients &&
                                  _pageController
                                      .position
                                      .hasContentDimensions) {
                                final page =
                                    _pageController.page ??
                                    _pageController.initialPage.toDouble();
                                final distance = (page - i).abs();
                                scale = (1 - distance * 0.15).clamp(0.90, 1.0);
                                AppLogger.log(
                                  "Current Page: ${_pageController.page}",
                                );
                              }
                              return Transform.scale(
                                scale: scale,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6.0,
                                  ),
                                  child: _AddSubCard(
                                    title: sub[i].title,
                                    img: sub[i].img,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: sizeH(20)),
            //--- Description txt
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Description',
                  style: TextStyle(color: appColor.onSecondary),
                ),
              ),
            ),
            //---Description feild
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: appColor.secondaryContainer.withOpacity(0.7),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: appColor.tertiary),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: sizeH(60)),
            //---Price
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    _ActionButton(icon: Icons.remove),
                    Spacer(),
                    Column(
                      children: [
                        Text("Monthly price "),
                        Text(
                          '\$${_amounVal.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 26,
                            color: appColor.onPrimary,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: 150,
                          height: 1,
                          color: appColor.secondaryContainer.withOpacity(0.7),
                        ),
                      ],
                    ),

                    const Spacer(),
                    _ActionButton(icon: Icons.add),
                  ],
                ),
              ),
            ),
           SliverToBoxAdapter(child: sizeH(100),),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: PrimaryButton(
                  onPressed: () {},
                  txt: "Add this platform",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: appColor.secondaryContainer.withOpacity(0.5),
        foregroundColor: appColor.tertiaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(15),
        elevation: 6,
      ),
      onPressed: () {},
      child: Icon(icon, size: 30),
    );
  }
}

class _AddSubCard extends StatelessWidget {
  const _AddSubCard({super.key, required this.title, required this.img});

  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: appH * 0.17,
          width: appW * 0.4,
          child: Image.asset(img),
        ),
        const SizedBox(height: 14),
        Text(title, style: TextStyle(color: appColor.onPrimary)),
      ],
    );
  }
}
