import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstructure/generated/login_entity.dart';
import 'package:getxstructure/routes/app_pages.dart';
import 'package:getxstructure/utils/constants.dart';
import 'package:getxstructure/utils/custom_toast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

@pragma('vm:entry-point')
class LoginController extends GetxController {
  FocusNode? currentFocus = FocusManager.instance.primaryFocus;
  Rx<TextEditingController> username = TextEditingController().obs;
  Rx<TextEditingController> mobile = TextEditingController().obs;

  RxBool usernameError = false.obs;
  RxBool mobileError = false.obs;

  RxBool isusernameTyping = false.obs;
  RxBool isMobileTyping = false.obs;

  var isLoading = false.obs;

  void usernameValidation() {
    if (username.value.text.isEmpty) {
      usernameError.value = true;
    } else {
      usernameError.value = false;
    }

    if (usernameError.value) {
      isusernameTyping.value = true;
    }
  }

  void mobileValidation() {
    if (mobile.value.text.isEmpty) {
      mobileError.value = true;
    } else {
      mobileError.value = false;
    }

    if (mobileError.value) {
      isMobileTyping.value = true;
    }
  }

  void loginValidation(BuildContext context) {
    FocusScope.of(context).unfocus();
    isusernameTyping.value = true;
    isMobileTyping.value = true;

    usernameValidation();
    mobileValidation();

    if (username.value.text.isEmpty) {
      showToasterrorborder("Please Enter Username", context);
    } else if (mobile.value.text.isEmpty) {
      showToasterrorborder("Please Enter Mobile Number", context);
    } else {
      isLoading(true);
      Get.offAllNamed(Routes.first);
    }
  }

  Future<void> login(String orderID, String mobileNumber) async {
    if (orderID == '123' || mobileNumber == '0000000000') {
      if (kDebugMode) {
        print("Skipping login due to default values.");
      }
      debugPrint('Skipping login due to default values}');
      return;
    }

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.reload();

      String messageValue =
          prefs.getString('first_message') ?? 'User Registered Successfully';

      if (kDebugMode) {
        print("Order ID: $orderID");
        print("Phone: $mobileNumber");
        print('message_login_update: $messageValue');
      }

      debugPrint('Order ID: $orderID');
      debugPrint('Phone: $mobileNumber');
      debugPrint('message_login_update: $messageValue');

      final response = await http.post(
        Uri.parse('${Constants.baseUrl}${Constants.login}'),
        body: {'order_id': orderID, 'phone': mobileNumber, 'msg': messageValue},
      );

      if (kDebugMode) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }

      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (kDebugMode) {
          print("Full parsed response: $responseData");
        }
        debugPrint("Full parsed response: $responseData");

        LoginEntity loginEntity = LoginEntity.fromJson(responseData);

        if (loginEntity.responseCode.toString() == "1") {
          if (kDebugMode) {
            print('Login successful!');
          }
          debugPrint('Login successful!');

          await prefs.setString('order_id', orderID);
          await prefs.setString('mobile_number', mobileNumber);
          await prefs.setBool('isLoggedIn', true);

          await prefs.reload();
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Login error: $e");
      }
      debugPrint("Login error: $e");
    }
  }
}
