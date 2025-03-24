import 'package:flutter/material.dart';
import 'package:getxstructure/utils/app_colors.dart';
import 'package:getxstructure/utils/text_style.dart';
import 'package:getxstructure/widget/custom_app_bar.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
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
        titleText: 'Database',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Database Screen',
              style: textStyleW700(size.width * 0.042, AppColors.blackText),
            ),
          ],
        ),
      ),
    );
  }
}
