import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstructure/advertising/advertising_screen.dart';
import 'package:getxstructure/classified/classified_screen.dart';
import 'package:getxstructure/database/database_screen.dart';
import 'package:getxstructure/firstscreen/home_controller.dart';
import 'package:getxstructure/home/home_screen.dart';
import 'package:getxstructure/more/more.dart';
import 'package:getxstructure/utils/app_colors.dart';
import 'package:getxstructure/widget/bottom_nav_bar.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(
        () =>
            controller.newIndex.value == 0
                ? const HomeScreen()
                : controller.newIndex.value == 1
                ? const ClassifiedScreen()
                : controller.newIndex.value == 2
                ? const DatabaseScreen()
                : controller.newIndex.value == 3
                ? const AdvertisingScreen()
                : const More(),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          controller.newIndex.value = index;
          controller.tappedIndex.value = index;
        },
      ),
    );
  }
}
