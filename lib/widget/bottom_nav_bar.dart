import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getxstructure/firstscreen/home_controller.dart';
import 'package:getxstructure/utils/app_colors.dart';
import 'package:getxstructure/utils/lists.dart';
import 'package:getxstructure/utils/text_style.dart';


class BottomNavBar extends StatefulWidget {
  final Function onTap;
  const BottomNavBar({super.key, required this.onTap});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          bottomBarImages.length,
          (index) => Obx(
            () => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  widget.onTap(index);
                },
                borderRadius: BorderRadius.circular(50),
                // ignore: deprecated_member_use
                splashColor: AppColors.primaryColor.withOpacity(0.3),
                // ignore: deprecated_member_use
                highlightColor: AppColors.primaryColor.withOpacity(0.1),
                child: Container(
                  height: size.height * 0.07,
                  width: size.height * 0.07,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        bottomBarImages[index],
                        // ignore: deprecated_member_use
                        color: (controller.tappedIndex.value == index)
                            ? AppColors.primaryColor
                            : AppColors.blackText,
                        height: 26,
                      ),
                      Text(
                        bottomBarTexts[index],
                        style: textStyleW600(
                          size.width * 0.020,
                          (controller.tappedIndex.value == index)
                              ? AppColors.primaryColor
                              : AppColors.blackText,
                          isMetropolis: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
