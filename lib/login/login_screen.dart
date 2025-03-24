import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getxstructure/generated/assets.dart';
import 'package:getxstructure/login/controller/login_controller.dart';
import 'package:getxstructure/utils/app_colors.dart';
import 'package:getxstructure/utils/extension_classes.dart';
import 'package:getxstructure/widget/border_text_field.dart';
import 'package:getxstructure/widget/custom_mobile_field.dart';
import 'package:getxstructure/widget/normal_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: true,

        body: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(Assets.svgLogin),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  color: AppColors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Obx(
                          () => BorderTextField(
                            keyboard: TextInputType.name,
                            textInputType: const [],
                            hint: "UserName",
                            controller: controller.username.value,
                            isError: controller.usernameError.value,
                            byDefault: !controller.isusernameTyping.value,
                            maxLength: 100,
                            onChanged: (value) {
                              controller.usernameValidation();
                              controller.isusernameTyping.value = true;
                            },
                            height: 58,
                          ),
                        ),
                        15.sbh,

                        Obx(
                          () => CustomMobileField(
                            height: 58,
                            hint: "Mobile Number",
                            controller: controller.mobile.value,
                            textInputType: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboard: TextInputType.phone,
                            isError: controller.mobileError.value,
                            byDefault: !controller.isMobileTyping.value,
                            onChanged: (value) {
                              controller.mobileValidation();
                              controller.isMobileTyping.value = true;
                            },
                          ),
                        ),
                        20.sbh,
                        NormalButton(
                          height: 50,
                          onPressed: () {
                            controller.loginValidation(context);
                          },
                          text: 'Track Order',
                          isLoading: controller.isLoading,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
            ],
          ),
        ),
      ),
    );
  }
}
