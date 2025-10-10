import 'package:flutter/material.dart';
import '../../../../core/const/app_colors.dart';
import '../../../../core/utils/tools.dart';

class MyBottmAppBar extends StatefulWidget {
  const MyBottmAppBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.icons = const [
      Icons.home,
      Icons.dashboard,
      Icons.calendar_view_day_outlined,
      Icons.credit_card,
    ],
  });

  final int currentIndex;
  final Function(int index) onTap;
  final List<IconData> icons;

  @override
  State<MyBottmAppBar> createState() => _MyBottmAppBarState();
}

class _MyBottmAppBarState extends State<MyBottmAppBar> {
  final double hpad = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(hpad, 0, hpad, 16),
      decoration: const BoxDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: BottomAppBar(
          notchMargin: 8,
          color: appColor.secondaryContainer,
          shape: InsetCircularNotchedRectangle(inset: hpad),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.icons.length + 1,
            itemBuilder: (context, index) {
              if (index == 2) {
                return const SizedBox(width: 80);
              }
              final actualIndex = index > 2 ? index - 1 : index;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    final actualIndex = index > 2 ? index - 1 : index;
                    widget.onTap(actualIndex);
                    setState(() {});
                  },
                  child: Icon(
                    widget.icons[actualIndex],
                    color: widget.currentIndex == actualIndex
                        ? appColor.onPrimary
                        : AppColors.gray50,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class InsetCircularNotchedRectangle extends CircularNotchedRectangle {
  final double inset;
  const InsetCircularNotchedRectangle({this.inset = 0});

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final shiftedGuest = guest?.shift(Offset(-inset, 0));
    return super.getOuterPath(host, shiftedGuest);
  }
}
