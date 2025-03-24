import 'package:flutter/material.dart';
import 'package:getxstructure/utils/app_colors.dart';
import 'package:getxstructure/utils/text_style.dart';
import 'package:getxstructure/widget/custom_app_bar.dart';

class AdvertisingScreen extends StatefulWidget {
  const AdvertisingScreen({super.key});

  @override
  State<AdvertisingScreen> createState() => _AdvertisingScreenState();
}

class _AdvertisingScreenState extends State<AdvertisingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,

      appBar: CustomAppBar(
        size: MediaQuery.of(context).size,
        titleText: 'Advertising',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Advertising Screen',
              style: textStyleW700(size.width * 0.042, AppColors.blackText),
            ),
          ],
        ),
      ),
    );
  }
}
